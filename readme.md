# AWS CodeDeploy with CodePipeline Sample Project

This project demonstrates how to use AWS CodeDeploy with AWS CodePipeline to automate the deployment of your application.

## Prerequisites

- AWS Account
- AWS CLI configured
- IAM roles for CodeDeploy and CodePipeline
- S3 bucket for storing artifacts

## Setup

1. **Clone the repository:**

   ```sh
   git clone https://github.com/NeelDevenShah/AWS-CodeDeploy-with-CodePipeline-Sample-Project.git
   cd AWS-CodeDeploy-with-CodePipeline-Sample-Project
   ```

2. **Create an S3 bucket:**

   ```sh
   aws s3 mb s3://your-bucket-name
   ```

3. **Upload the application files to S3:**

   ```sh
   aws s3 cp app/ s3://your-bucket-name/app/ --recursive
   ```

4. **Create a CodeDeploy application:**

   ```sh
   aws deploy create-application --application-name MyApplication
   ```

5. **Create a deployment group:**

   ```sh
   aws deploy create-deployment-group --application-name MyApplication --deployment-group-name MyDeploymentGroup --service-role-arn arn:aws:iam::your-account-id:role/CodeDeployServiceRole --deployment-config-name CodeDeployDefault.OneAtATime --ec2-tag-filters Key=Name,Value=MyEC2Instance,Type=KEY_AND_VALUE
   ```

6. **Create a CodePipeline:**
   ```sh
   aws codepipeline create-pipeline --cli-input-json file://pipeline.json
   ```

## Deployment

1. **Start a deployment:**

   ```sh
   aws deploy create-deployment --application-name MyApplication --deployment-group-name MyDeploymentGroup --s3-location bucket=your-bucket-name,key=app.zip,bundleType=zip
   ```

2. **Monitor the deployment:**
   ```sh
   aws deploy get-deployment --deployment-id d-XXXXXXXXX
   ```

## Cleanup

1. **Delete the CodePipeline:**

   ```sh
   aws codepipeline delete-pipeline --name MyPipeline
   ```

2. **Delete the CodeDeploy application:**

   ```sh
   aws deploy delete-application --application-name MyApplication
   ```

3. **Remove the S3 bucket:**
   ```sh
   aws s3 rb s3://your-bucket-name --force
   ```

## License

This project is licensed under the MIT License.

## Contributing

Contributions are welcome! Please submit a pull request.

## Contact

For any questions or issues, please open an issue on GitHub.
