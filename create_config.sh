#!/bin/bash

PUBLIC_IP="" #YOUR PUBLIC ADDRESS
PUBLIC_PORT="" #YOUR PUBLIC PORT
PROTOCOL="tcp-client" #YOUR PROTOCOL udp/tcp-client

mkdir configs
for i in `seq 1 5`;
        do
                echo "Creating user $i dir..."
                mkdir configs/user$i
                echo "Copying user cert and key..."
                cp certificates/cert_export_user$i@CA.* configs/user$i
                cp certificates/cert_export_CA.crt configs/user$i

                echo "Creating user auth..."
                echo "user$i\nuser000$i" > configs/user$i/user.auth
                
                echo "Creating config file..."
                sed "s/{CLIENT}/user$i@CA/g; s/{PUBLIC_IP}/$PUBLIC_IP/g; s/{PUBLIC_PORT}/$PUBLIC_PORT/g; s/{PROTOCOL}/$PROTOCOL/g" template.ovpn > configs/user$i/user$i.ovpn
        done  