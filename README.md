## AWS Dms Cdc Sample

AWS Lambda and CloudFormation code for loading CDC data from Relational databases to Amazon Kinesis using Database Migration Service.

## License Summary

This sample code is made available under a modified MIT license. See the LICENSE file.
Install-Module -Name AWSPowerShell -AllowClobber
Get-AWSCredential -ListProfileDetail
Remove-AWSCredentialProfile

Set-AWSCredential -AccessKey AKIAIIEUXAGTTTNN3NGA -SecretKey nzpLAY7blaysysysBFnzSypMVZFSfhA -StoreAS powershellProfile
Initialize-AWSDefaultConfiguration -ProfileName powershellProfile
New-CFNStack -StackName CDCExperimental -TemplateBody (Get-Content -Path .\CDCCloudformation.yml -Raw) -ProfileName powershellProfile -MasterUserPassword a12345
Remove-CFNStack -StackName CDCExperimental
Update-CFNStack -StackName CDCExperimental -TemplateBody (Get-Content -Path .\CDCCloudformation.yml -Raw) -ProfileName powershellProfile -Capability CAPABILITY_NAMED_IAM

New-IAMRole -RoleName dms-vpc-role -AssumeRolePolicyDocument (Get-Content -raw .\dmsAssumeRolePolicy.json)
Register-IAMRolePolicy -RoleName dms-vpc-role -PolicyArn arn:aws:iam::aws:policy/service-role/AmazonDMSVPCManagementRole