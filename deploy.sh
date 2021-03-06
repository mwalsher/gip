#/usr/bin/bash

set -e

GOOS=linux go build -o process_file
zip -o process_file.zip process_file

export $(cat .env | xargs)

# aws-mfa aws lambda create-function \
# --region us-west-2 \
# --function-name ProcessFileFunction \
# --zip-file fileb://./process_file.zip \
# --runtime go1.x \
# --tracing-config Mode=Active \
# --role $ROLE \
# --handler process_file

aws-mfa aws lambda update-function-code \
  --region us-west-2 \
  --function-name ProcessFileFunction \
  --zip-file fileb://./process_file.zip
