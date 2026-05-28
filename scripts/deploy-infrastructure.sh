#!/bin/bash
set -e

echo "🚀 Deploying StartTech Infrastructure..."

# Variables
AWS_REGION="us-east-1"
PROJECT_NAME="starttech"
STATE_BUCKET="starttech-terraform-state-913509421387"

# Create S3 bucket for Terraform state if it doesn't exist
echo "📦 Checking Terraform state bucket..."
if ! aws s3 ls "s3://${STATE_BUCKET}" 2>/dev/null; then
  echo "Creating state bucket..."
  aws s3 mb "s3://${STATE_BUCKET}" --region ${AWS_REGION}
  aws s3api put-bucket-versioning \
    --bucket ${STATE_BUCKET} \
    --versioning-configuration Status=Enabled
  echo "✅ State bucket created"
else
  echo "✅ State bucket already exists"
fi

# Navigate to terraform directory
cd "$(dirname "$0")/../terraform"

# Initialize Terraform
echo "🔧 Initializing Terraform..."
terraform init

# Validate
echo "✅ Validating Terraform..."
terraform validate

# Plan
echo "📋 Planning infrastructure..."
terraform plan -out=tfplan \
  -var="project_name=${PROJECT_NAME}"

# Apply
echo "🏗️ Applying infrastructure..."
terraform apply -auto-approve tfplan

# Show outputs
echo "📤 Infrastructure outputs:"
terraform output

echo "✅ Infrastructure deployment complete!"
