<?php 

        header("Content-Type: text/plain");

	go();

	function go()
	{
		$okta_cert = file_get_contents('okta.cert');

		$xmlString = file_get_contents('saml-response.xml');	

		$xmlDoc = new DOMDocument();

		$xmlDoc->loadXML($xmlString);

		$xpath = new DOMXPath($xmlDoc);

		$nodeList = $xpath->query('/saml2p:Response');

		$item = $nodeList->item(0);

		$signatureNode = find_node_named($item, '/saml2p:Response/ds:Signature');

		$signatureValueNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:SignatureValue');

		$signedInfoNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:SignedInfo');

		$signedInfoNodeCanonicalized = $signedInfoNode->C14N(true, false);

		print "signed info: [" . $signedInfoNode->nodeValue . "]\n";

		print "signed info canonicalized: [" . $signedInfoNodeCanonicalized . "]\n";

		$keyInfoNode = find_node_named($signatureNode, '/saml2p:Response/ds:Signature/ds:KeyInfo');

		$x509DataNode = find_node_named($keyInfoNode, '/saml2p:Response/ds:Signature/ds:KeyInfo/ds:X509Data');

		$x509certNode = find_node_named($x509DataNode, '/saml2p:Response/ds:Signature/ds:KeyInfo/ds:X509Data/ds:X509Certificate');

		$x509cert = "-----BEGIN CERTIFICATE-----\n" . $x509certNode->nodeValue . "\n" . "-----END CERTIFICATE-----";

		$publicKey = openssl_get_publickey($x509cert);

		$signature = base64_decode($signatureValueNode->nodeValue);
		
		print("\n\nx509 certificate: [" . $x509cert . "]\n");

		print("\n\nsignature: [" . $signatureValueNode->nodeValue . "]\n");

		file_put_contents('sig.txt', $signature);

		print("\n\npublic key: " . $publicKey . "\n\n");

		print("\n\nsigned Info node canonicalized to a string: [" . $signedInfoNodeCanonicalized) . "]\n\n";

		$ok = openssl_verify($signedInfoNodeCanonicalized, $signature, $publicKey, "sha256WithRSAEncryption");

#sha1WithRSAEncryption


		if ( $ok ) 
		{
			print("ok");
		}
		else
		{
			print('not ok');
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

?>

