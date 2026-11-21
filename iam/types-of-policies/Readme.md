# Create IAM Policy
aws iam create-policy --policy-name my-fun-policy --policy-document file://policy.json

# Attach policy to user
aws iam attach-user-policy --policy-arn arn:aws:iam::904754637771:policy/my-fun-policy --user-name NAME

# Update the policy version
aws iam create-policy-version --policy-arn arn:aws:iam::904754637771:policy/my-fun-policy --policy-document file://policy.json --set-as-default

# Delete the policy version
aws iam delete-policy-version --policy-arn arn:aws:iam::904754637771:policy/my-fun-policy --version-id v1
# ... and many more (if have more version except default)

# Detach Policy from User
aws iam detach-user-policy --user-name NAME --policy-arn arn:aws:iam::904754637771:policy/my-fun-policy

# Delete IAM Policy
aws iam delete-policy --policy-arn arn:aws:iam::904754637771:policy/my-fun-policy