BASE_NAME={Base name}
KEY_NAME={Key pair}
STACK_NAME={Stack name}
AMI_NAME={AMI name}

aws ec2 create-key-pair --key-name $KEY_NAME \
    --query KeyMaterial \
    --output text > $KEY_NAME.pem

aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://cfn/ami/cfn-ec2.yml \
    --cli-input-json file://cfn/ami/cfn-ec2.parameters-cli.json

# Run below after creating the stack
INSTANCE_ID=$(aws ec2 describe-instances \
    --filters Name=tag-value,Values=$BASE_NAME Name=instance-state-name,Values=running \
    --query "Reservations[*].Instances[*].[InstanceId]" \
    --output text)

aws ec2 get-password-data \
    --instance-id $INSTANCE_ID \
    --priv-launch-key $KEY_NAME.pem

# Run below after installing necessary software
aws ec2 create-image \
    --instance-id $INSTANCE_ID \
    --name $AMI_NAME \
    --description "An AMI for CloudFormation"
