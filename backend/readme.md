 aws cloudformation validate-template --template-body file://template.yaml       


 aws cloudformation create-stack --stack-name S3Stack --template-body file://template.yaml --parameters ParameterKey=BucketName,ParameterValue=backend-s3-enrique-cloud ParameterKey=EnableVersioning,ParameterValue=true --region us-east-1


 aws cloudformation describe-stacks --stack-name S3Stack --region us-east-1


eliminar
aws cloudformation delete-stack --stack-name S3Stack --region us-east-1


ver todos los S3
aws s3 ls

