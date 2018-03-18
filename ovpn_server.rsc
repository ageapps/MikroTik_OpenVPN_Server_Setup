## server and ca certificates
/certificate add name=CA-template country="ES" state="ES" locality="Spain" organization="IEEE"  common-name="CA" key-size=2048 key-usage=crl-sign,key-cert-sign
/certificate add name=SERVER-tpl country="ES" state="ES" locality="Spain" organization="IEEE" common-name="SERVER" key-size=2048 key-usage=digital-signature,key-encipherment,tls-server
/certificate add name=CLIENT-tpl country="ES" state="ES" locality="Spain" organization="IEEE" common-name="CLIENT" key-size=2048 key-usage=tls-client
/certificate sign CA-tpl ca-crl-host=127.0.0.1 name="CA"
/certificate sign SERVER-tpl ca="CA" name="SERVER"


## create IP pool
/ip pool add name=OVPN-POOL ranges=172.17.0.2-172.17.0.254 

## add VPN profile
/ppp profile add dns-server=172.17.0.1 local-address=172.17.0.1 name=OVPN-PROFILE remote-address=OVPN-POOL use-encryption=yes

## setup OpenVPN server
/interface ovpn-server server set auth=sha1 certificate="SERVER" cipher=aes128,aes192,aes256 default-profile=OVPN-PROFILE enabled=yes require-client-certificate=yes

## add a firewall rule
/ip firewall filter add chain=input dst-port=1194 protocol=tcp comment="Allow OpenVPN"



