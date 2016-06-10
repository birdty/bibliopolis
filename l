<?php 
	require_once("DbConnection.php");

	$dbh = getDbConnection('vdb');

	execute();

	function execute()
	{
	  # replace by $xmlString = base64_decode($_POST['SAMLResponse']);
	  $xmlString = file_get_contents('saml-response.xml');

	  if ( valid_saml_certificate($xmlString) )
	  {
        my $sso_referer = find_sso_referer($ENV{'HTTP_REFERER'});

        if ( ! $sso_referer ) {
                va::error($db, {}, "Company no longer exists for single sign on");
                return;
        }

        $user = find_user($email, $sso_referer);

        if ( ! $user )
        {
                # extract email, first name and last name from decoded xml
                my $first_name = find_saml2_response_attribute_value($xml_path, 'first_name');
                my $last_name = find_saml2_response_attribute_value($xml_path, 'last_name');

                require Epromo::Entity::Company;

                my $random_password = Epromo::Entity::Company->generate_unique_password_in($sso_referer->{'coid'});       

                $user = create_user_generic(
                        {
                                'email' => $email,
                                'id' => $random_password,
                                'given_name' => $first_name,
                                'family_name' => $last_name,
                                'sso_referer' => $sso_referer
                        }
                );
        }

        my $login_url = generate_login_url($user);

        print("Status: 302 Redirect\nLocation: $login_url\n\n");



		  header("Location: http://www.google.com");
	  }
	  else
	  {
		  print("Access Denied.");
	  }
	}


	function valid_saml_certificate($xmlString)
	{
		$okta_cert = file_get_contents('okta.cert');

		$xmlDoc = new DOMDocument();

		$xmlDoc->loadXML($xmlString);

		$xpath = new DOMXPath($xmlDoc);

		$nodeList = $xpath->query('/saml2p:Response');

		$item = $nodeList->item(0);

		$signatureNode = find_node_named($item, '/saml2p:Response/ds:Signature');

		$signatureValueNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:SignatureValue');

		$signedInfoNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:SignedInfo');

		$signedInfoNodeCanonicalized = $signedInfoNode->C14N(true, false);

		$keyInfoNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:KeyInfo');

		$x509DataNode = find_node_named($keyInfoNode, '/saml2p:Response/ds:Signature/ds:KeyInfo/ds:X509Data');

		$x509certNode = find_node_named($x509DataNode, '/saml2p:Response/ds:Signature/ds:KeyInfo/ds:X509Data/ds:X509Certificate');

		$x509cert = "-----BEGIN CERTIFICATE-----\n" . $x509certNode->nodeValue . "\n" . "-----END CERTIFICATE-----";

		if ( $x509cert != $okta_cert )
		{
			return false;
		}

		$publicKey = openssl_get_publickey($x509cert);

		$signature = base64_decode($signatureValueNode->nodeValue);
		
		$ok = openssl_verify($signedInfoNodeCanonicalized, $signature, $publicKey, "sha256WithRSAEncryption");

		if ( $ok ) 
		{
			return true;
		}
		else
		{
			return false;
		}	
	}

	function find_node_named($domElement, $path)
	{
		if ( $domElement->hasChildNodes() )
		{
			foreach ( $domElement->childNodes as $child )
        		{
				if ( $child->getNodePath() == $path )
				{
					return $child;
				}
        		}

		}
	}

	function find_sso_referer($_ENV['HTTP_REFERER'])
	{

	}
?>

