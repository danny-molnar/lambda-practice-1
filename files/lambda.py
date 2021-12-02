import boto3
import json

def pet_handler(event, context): #:)
    s3 = boto3.client('s3')

    # Listing existing buckets
    response = s3.list_buckets()
    print("Existing buckets: ")
    for bucket in response['Buckets']:
        print(f'  {bucket["Name"]}')

    print("---------------")

    # Printing favorite food
    
    pets_bucket = event["S3Bucket"] # getting the bucket name from event
    data_file = event["S3Prefix"] # getting data file name from event
    pet_name = event["PetName"] # getting pet name from event
    
    result = s3.get_object(Bucket = pets_bucket, Key = data_file)
    data_str = result["Body"].read().decode() # this is where i spent ages, because this makes data to be a string, not an object...
    data = json.loads(data_str) # this now converts the previous string into a dictionary
    
    # printing the list of foods that matches the pet name
    for index in data["pets"]:
        if index["name"] == pet_name:
            print(f"My name is {pet_name} and my favourite foods are as follows:")
            for food in index["favFoods"]:
                print(food)
    

    print("---------------")