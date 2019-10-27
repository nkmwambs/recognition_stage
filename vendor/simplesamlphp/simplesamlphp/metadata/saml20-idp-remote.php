<?php
/**
 * SAML 2.0 remote IdP metadata for SimpleSAMLphp.
 *
 * Remember to remove the IdPs you don't use from this file.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-remote
 */

 $metadata['http://www.okta.com/exk1brsu7xu76cn0v357'] = array (
  'SingleSignOnService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'https://dev-592139.okta.com/app/compassiondev592139_staffrecog2_1/exk1brsu7xu76cn0v357/sso/saml',
    ),
  ),
  'SingleLogoutService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'http://localhost/recognition/vendor/simplesamlphp/simplesamlphp/www/module.php/saml/sp/saml2-logout.php/default-sp',
    ),
  ),
  'AssertionConsumerService' => 
  array (
    0 => 
    array (
      'index' => 0,
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST',
      'Location' => 'http://localhost/recognition/vendor/simplesamlphp/simplesamlphp/www/module.php/saml/sp/saml2-acs.php/default-sp',
    ),
    1 => 
    array (
      'index' => 1,
      'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:browser-post',
      'Location' => 'http://localhost/recognition/vendor/simplesamlphp/simplesamlphp/www/module.php/saml/sp/saml1-acs.php/default-sp',
    ),
    2 => 
    array (
      'index' => 2,
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact',
      'Location' => 'http://localhost/recognition/vendor/simplesamlphp/simplesamlphp/www/module.php/saml/sp/saml2-acs.php/default-sp',
    ),
    3 => 
    array (
      'index' => 3,
      'Binding' => 'urn:oasis:names:tc:SAML:1.0:profiles:artifact-01',
      'Location' => 'http://localhost/recognition/vendor/simplesamlphp/simplesamlphp/www/module.php/saml/sp/saml1-acs.php/default-sp/artifact',
    ),
  ),
  'contacts' => 
  array (
    0 => 
    array (
      'emailAddress' => 'londuso@ke.ci.org',
      'contactType' => 'technical',
      'givenName' => 'Administrator',
    ),
  ),
  'certData' => 'MIIDpDCCAoygAwIBAgIGAW0VGzwNMA0GCSqGSIb3DQEBCwUAMIGSMQswCQYDVQQGEwJVUzETMBEG
A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU
MBIGA1UECwwLU1NPUHJvdmlkZXIxEzARBgNVBAMMCmRldi01OTIxMzkxHDAaBgkqhkiG9w0BCQEW
DWluZm9Ab2t0YS5jb20wHhcNMTkwOTA5MDgxODI5WhcNMjkwOTA5MDgxOTI5WjCBkjELMAkGA1UE
BhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNV
BAoMBE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRMwEQYDVQQDDApkZXYtNTkyMTM5MRwwGgYJ
KoZIhvcNAQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
lJuRoaN+OflZmoUL34lADiG3boTwb6FAidIqJ08TDIGkJhspn4KP1TroOFyZGOvtWUOeZbdXquYm
GD4y8gpTj+fSjz4tV8hgi43yO90qJYj82FsGBsdMAX5b4kZKaSkLVZFNVsN3tt8rxzsr4C0JW9o+
j7drvuxnvpFzZ2pLoAuFR+d2tLixL6F39+4UDpYQQ+ItjNR90LhW3x/zPZRaq2dsP3g+Z9BjD+T4
ptJzb+zf7YFo2dDPmMLLLpacukfa+ghDe+xiikX7TuDJqrMgiWiyKjSIQ/zTEbxQHM0oTmhzH0oI
s7WGYd6X/8bdELgAV3780fS3maAjPz8SE03HWQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAtK/NN
egidp0lM8xhYODYSTS4o9IhHEJzx+KXVeiu6DLGtWYbuzI/9v8c8iOGb0WgzyNVES/Qu9fK3O7Er
Eu7AOL1j8Wv7JiPn8hEPlgb3DT+Ycs85UHqk3gINPnUqPGHHfBIKFHgB6FH2qB+o2PYTVDJ9FhpY
J3M0FdXGHfQTu8pKLrGFOQWLtKoSY9UqmaNW2ONFxFc36ot9ZLwRV9nLpo/SAczoh1XcQeABEi/G
/r2J/uIl59KFsP+Qjlp5q7UqjW6ljlcGhAQTNRZD8RwHhJazQVWKUhk7l/cVA4rfEJLa7T9fn9Xc
vrmHDsLf4Ztd34dywsN8nlBcBxsA7b6m',
);