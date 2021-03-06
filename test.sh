export $(cat .env | xargs)

# --invocation-type Event \
# --log-type Tail \

# aws-mfa aws lambda invoke \
#   --invocation-type RequestResponse \
#   --function-name ProcessFileFunction \
#   --region us-west-2 \
#   --payload file://./tests/s3_event_example.txt \
#   output.txt

aws-mfa aws s3api put-object --bucket itg-hack-day-file-uploads --key image.jpg --body ./tests/image.jpg
