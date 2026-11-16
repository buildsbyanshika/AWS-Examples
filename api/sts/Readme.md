# Cretae a user and access key
aws iam create-user --user-name sts-user
aws iam create-access-key --user-name sts-user --output table


# Cretae a role that will access resources
aws configure

# edit defaul profile
nano ~/.aws/credentials

# test who you are 
aws sts get-caller-identity --profile sts
aws sts get-caller-identity

# New user credentials and assume role