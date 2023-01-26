STACK_NAME={STACK NAME}

aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://cfn/codepipeline/cfn-codepipeline.yml \
    --cli-input-json file://cfn/codepipeline/cfn-codepipeline.parameters-cli.json