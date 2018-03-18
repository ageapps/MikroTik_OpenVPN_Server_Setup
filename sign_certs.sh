#!/bin/bash
for i in `seq 1 5`;
        do
                echo "Signing cert from user $i"
                openssl rsa -in certificates/cert_export_user$i\@CA.key -out certificates/cert_export_user$i\@CA.key
        done  