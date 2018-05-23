#!/bin/bash
echo "Criando Bucket S3"
aws s3api create-bucket --bucket bucket-geru-renato-coutinho --region us-east-1 --acl public-read-write
sleep 2
git clone https://github.com/renatoadsumus/geru_app.git artefato_deploy
sleep 2
zip -r app_geru_eb.zip /artefato_deploy/aws_eb/
echo "Enviando artefato_deploy para S3"
sleep 2
aws s3 sync app_geru_eb.zip s3://bucket-geru-renato-coutinho
