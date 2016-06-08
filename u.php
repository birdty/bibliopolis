<!DOCTYPE html>
<html>
<head>
<title>Hi</title>
</head>

<body>

<?php
	phpinfo();	

	$xmlDoc->loadXML($xmlString);

	$xpath = new DOMXPath($xmlDoc);

	print('0');

	$xpath->registerNamespace('secdsig', 'http://www.w3.org/2000/09/xmldsig#');

	// fetch Signature node from XML
	$query = ".//secdsig:Signature";
	$nodeset = $xpath->query($query, $xmlDoc);
	$signatureNode = $nodeset->item(0);

	// fetch SignedInfo node from XML
	$query = "./secdsig:SignedInfo";
	$nodeset = $xpath->query($query, $signatureNode);
	$signedInfoNode = $nodeset->item(0);

	// canonicalize SignedInfo using the method descried in
	// ./secdsig:SignedInfo/secdsig:CanonicalizationMethod/@Algorithm
	$signedInfoNodeCanonicalized = $signedInfoNode->C14N(true, false);

	print('a');

	// fetch the x509 certificate from XML
	$query = 'string(./secdsig:KeyInfo/secdsig:X509Data/secdsig:X509Certificate)';
	$x509cert = $xpath->evaluate($query, $signatureNode);
	// we have to re-wrap the certificate from XML to respect the PEM standard
	$x509cert = "-----BEGIN CERTIFICATE-----\n"
	    . $x509cert . "\n"
	    . "-----END CERTIFICATE-----";
	// fetch public key from x509 certificate
	$publicKey = openssl_get_publickey($x509cert);

	// fetch the signature from XML
	$query = 'string(./secdsig:SignatureValue)';
	$signature = base64_decode($xpath->evaluate($query, $signatureNode));

	print('b');

	// verify the signature
	$ok = openssl_verify($signedInfoNodeCanonicalized, $signature, $publicKey); 

	
	if ( $ok ) {
		print "ok";

	}
	else
	{
		print "not ok";
	}

}
*/


?>

</body>

</html>



