<?php
/**
 * SAML 2.0 remote IdP metadata for SimpleSAMLphp.
 *
 * Remember to remove the IdPs you don't use from this file.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-remote
 */

 $metadata['http://www.okta.com/exk1b8ukudcDfFoh7357'] = array (
   'SingleSignOnService' =>
     array(
       0 => array(
         'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
         'Location' => 'https://dev-585368.okta.com/app/cidev585368_africastaffrecognition_1/exk1b8ukudcDfFoh7357/sso/saml'
       )
     ),
   'SingleLogoutService' =>
   array (
     0 =>
     array (
       'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
       'Location' => 'http://localhost/recognition/saml2/www/module.php/saml/sp/saml2-logout.php/default-sp',
     ),
   ),
   'AssertionConsumerService' =>
   array (
     0 =>
     array (
       'index' => 0,
       'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST',
       'Location' => 'http://localhost/recognition/saml2/www/module.php/saml/sp/saml2-acs.php/default-sp',
     ),
     1 =>
     array (
       'index' => 1,
       'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:browser-post',
       'Location' => 'http://localhost/recognition/saml2/www/module.php/saml/sp/saml1-acs.php/default-sp',
     ),
     2 =>
     array (
       'index' => 2,
       'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact',
       'Location' => 'http://localhost/recognition/saml2/www/module.php/saml/sp/saml2-acs.php/default-sp',
     ),
     3 =>
     array (
       'index' => 3,
       'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:artifact-01',
       'Location' => 'http://localhost/recognition/saml2/www/module.php/saml/sp/saml1-acs.php/default-sp/artifact',
     ),
   ),
   'contacts' =>
   array (
     0 =>
     array (
       'emailAddress' => 'NKarisa@ke.ci.org',
       'contactType' => 'technical',
       'givenName' => 'Nicodemus',
       'surName' => 'Karisa',
     ),
   ),
   'certData' => 'MIIDpDCCAoygAwIBAgIGAW0FXr/JMA0GCSqGSIb3DQEBCwUAMIGSMQswCQYDVQQGEwJVUzETMBEG
A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU
MBIGA1UECwwLU1NPUHJvdmlkZXIxEzARBgNVBAMMCmRldi01ODUzNjgxHDAaBgkqhkiG9w0BCQEW
DWluZm9Ab2t0YS5jb20wHhcNMTkwOTA2MDY1ODE4WhcNMjkwOTA2MDY1OTE4WjCBkjELMAkGA1UE
BhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNV
BAoMBE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRMwEQYDVQQDDApkZXYtNTg1MzY4MRwwGgYJ
KoZIhvcNAQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
wBSpOx1nFt2LgMz2ilD0poIef5Pz3X7N5HEC+7UUnRW/ICV4jXwJf5Vyqy90oV3NKxw7MBynAAZ/
x58/qKZ+RO2n2HSxQjfg0c5foa0KIYkMdjnHgHwfs9sW4/xerNxAO5oiQccvGKweXlxLKj7hQ0+T
s4dj83lp0OHcQbg1lDt1RCRCV95YaVDdZEkvydeVsFo0e/sHCpvisVwUJFF22mmsSg1FrJfZbvED
LpUKcrsvK8O8atBKIO0zJk/UTs7qHayJzGsJ49zUf2mOHJWN1d1y5gig03/7CitPN3ltIJIxgrcM
mM7q73G4fkGd+0NEAwUAVMDdrmUrRs6EtdPvnwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAwLpA1
z9/Q1LeeRtdkKqFPnphQdenQ72GJsjhqhogEmwgYBO89FVYpzLHVffLb7OW/Ek1VliZ2qJHYVV5R
H32LTmHUtCPNc/Rqe0L56KKYWNSqTRBs4Ewc/7Uq7FuzyN8qWVJ72aB11WuHI2/TAyR8WSYK9Mfn
O+OlrW91Niox5p2PeyZN1Wke9OiJB4PJqxYfbQq4YMz6mee1ToBfzLgyRQVogVYEKeiL+VB2S31H
dlUchzCudpYnZgYgLCy0VPGvxyRBrVGSjPXJCncDh/3HzTuexItb+Whxi/xwOkApOgFYloQmQIkA
dnltfbY5cWh9eO9yRPKDuym9W4k4hwik',
 );
