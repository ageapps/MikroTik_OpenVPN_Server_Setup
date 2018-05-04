## PARAMETERS 
:global ORG "AGE"
:global COUNTRY "ES"
:global STATE "ES"
:global LOCALITY "Spain"
## Key sizes 1024, 2048, 4096
:global KEYSIZE 2048


## server and ca certificates
/certificate add name=CA-tpl country="$COUNTRY" state="$STATE" locality="$LOCALITY" organization="$ORG"  common-name="CA" key-size=$KEYSIZE key-usage=crl-sign,key-cert-sign
/certificate add name=SERVER-tpl country="$COUNTRY" state="$STATE" locality="$LOCALITY" organization="$ORG" common-name="SERVER" key-size=$KEYSIZE key-usage=digital-signature,key-encipherment,tls-server
/certificate add name=CLIENT-tpl country="$COUNTRY" state="$STATE" locality="$LOCALITY" organization="$ORG" common-name="CLIENT" key-size=$KEYSIZE key-usage=tls-client
/certificate sign CA-tpl ca-crl-host=127.0.0.1 name="CA"
/certificate sign SERVER-tpl ca="CA" name="SERVER"


## create IP pool
/ip pool add name=OVPN-POOL ranges=172.17.0.2-172.17.0.15 

## add VPN profile
/ppp profile add dns-server=172.17.0.1 local-address=172.17.0.1 name=OVPN-PROFILE remote-address=OVPN-POOL use-encryption=yes

## setup OpenVPN server
/interface ovpn-server server set auth=sha1 certificate="SERVER" cipher=aes128,aes192,aes256 default-profile=OVPN-PROFILE enabled=yes require-client-certificate=yes

## add a firewall rule
/ip firewall filter add chain=input dst-port=1194 protocol=tcp comment="Allow OpenVPN"



