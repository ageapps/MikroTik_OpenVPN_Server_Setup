:global CN "CA"
:global USERNAME "user1"
:global PASSWORD "user0001"

## add a user
/ppp secret add name=$USERNAME password=$PASSWORD profile=OVPN-PROFILE service=ovpn

## generate a client certificate
/certificate add name=client-template-to-issue copy-from="CLIENT-tpl" common-name="$USERNAME@$CN" 

/certificate sign client-template-to-issue ca="$CN" name="$USERNAME@$CN"
:delay 20
## client certificate, and private key
/certificate export-certificate "$USERNAME@$CN" export-passphrase="$PASSWORD"


:global USERNAME "user2"
:global PASSWORD "user0002"

## add a user
/ppp secret add name=$USERNAME password=$PASSWORD profile=OVPN-PROFILE service=ovpn

## generate a client certificate
/certificate add name=client-template-to-issue copy-from="CLIENT-tpl" common-name="$USERNAME@$CN" 

/certificate sign client-template-to-issue ca="$CN" name="$USERNAME@$CN"
:delay 20
## client certificate, and private key
/certificate export-certificate "$USERNAME@$CN" export-passphrase="$PASSWORD"

:global USERNAME "user3"
:global PASSWORD "user0003"

## add a user
/ppp secret add name=$USERNAME password=$PASSWORD profile=OVPN-PROFILE service=ovpn

## generate a client certificate
/certificate add name=client-template-to-issue copy-from="CLIENT-tpl" common-name="$USERNAME@$CN" 

/certificate sign client-template-to-issue ca="$CN" name="$USERNAME@$CN"
:delay 20
## client certificate, and private key
/certificate export-certificate "$USERNAME@$CN" export-passphrase="$PASSWORD"


:global USERNAME "user4"
:global PASSWORD "user0004"

## add a user
/ppp secret add name=$USERNAME password=$PASSWORD profile=OVPN-PROFILE service=ovpn

## generate a client certificate
/certificate add name=client-template-to-issue copy-from="CLIENT-tpl" common-name="$USERNAME@$CN" 

/certificate sign client-template-to-issue ca="$CN" name="$USERNAME@$CN"
:delay 20
## client certificate, and private key
/certificate export-certificate "$USERNAME@$CN" export-passphrase="$PASSWORD"


:global USERNAME "user5"
:global PASSWORD "user0005"

## add a user
/ppp secret add name=$USERNAME password=$PASSWORD profile=OVPN-PROFILE service=ovpn

## generate a client certificate
/certificate add name=client-template-to-issue copy-from="CLIENT-tpl" common-name="$USERNAME@$CN" 

/certificate sign client-template-to-issue ca="$CN" name="$USERNAME@$CN"
:delay 20
## export the CA, client certificate, and private key
/certificate export-certificate "$CN" export-passphrase="" 

/certificate export-certificate "$USERNAME@$CN" export-passphrase="$PASSWORD"