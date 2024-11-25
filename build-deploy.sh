#!/bin/bash

# Function to get and set environment variables from AWS Secrets Manager
get_and_set_secret() {
    echo "inner \$1: $1"
    local var_name=$1
    echo "Retrieving ${var_name} from AWS Secrets Manager..."
    local secret_value=$(aws secretsmanager get-secret-value --secret-id "registration/ui/${STAGE}/${var_name}" --query SecretString --output text)
    
    # if [ -z "$secret_value" ]; then
    #     echo "Error: Failed to retrieve ${var_name}"
    #     exit 1
    # fi
    
    echo "${var_name}=${secret_value}" >> .env
}

if [ -z "$STAGE" ]
then
  STAGE="dev"
fi

echo "Retrieving secrets from AWS Secrets Manager..."
get_and_set_secret "NR_KEY"
get_and_set_secret "NR_APP_ID"
# get_and_set_secret "NR_ACCOUNT_ID"