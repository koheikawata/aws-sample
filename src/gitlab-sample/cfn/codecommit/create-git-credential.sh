POLICY={POLICY NAME}
USER={USER NAME}
ACCOUNT={ACCOUNT ID}

aws iam create-policy \
    --policy-name $POLICY \
    --policy-document file://cfn/codecommit/access-user-policy.json

aws iam create-user --user-name $USER

aws iam attach-user-policy \
    --user-name $USER \
    --policy-arn arn:aws:iam::$ACCOUNT:policy/$POLICY

aws iam create-service-specific-credential \
    --user-name $USER \
    --service-name codecommit.amazonaws.com

aws codecommit create-repository --repository-name {REPOSITORY NAME}