import boto3
import json

def pet_handler(event, context):
    s3 = boto3.client('s3')

    # Listing buckets
    response = s3.list_buckets()
    print("Existing buckets: ")
    for bucket in response['Buckets']:
        print(f'  {bucket["Name"]}')

    print("---------------")

    # Reading data from object
    content_object = s3.get_object(Bucket="talent-academy-lambda-exercise", Key="sample_data.json")
    text = content_object["Body"].read().decode()
    pets=json.loads(text)
    print(pets['pets'][2]['favFoods'])

    print("---------------")

    # Reading data from S3 based on source event