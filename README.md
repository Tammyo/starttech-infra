# StartTech Infrastructure

This repository contains the Terraform infrastructure code and CI/CD pipeline for the StartTech application.

## Architecture Overview

- Frontend: React app hosted on S3 + CloudFront CDN
- Backend: Golang API on EC2 with Auto Scaling Group behind ALB
- Cache: ElastiCache Redis cluster
- Database: MongoDB Atlas
- Infrastructure: Managed with Terraform
- CI/CD: GitHub Actions

## Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform v1.5.7+
- GitHub repository secrets configured

## GitHub Secrets Required

| Secret | Description |
|--------|-------------|
| AWS_ACCESS_KEY_ID | AWS access key |
| AWS_SECRET_ACCESS_KEY | AWS secret key |

## Quick Start

1. Clone this repository
2. Create the Terraform state bucket:
   aws s3 mb s3://starttech-terraform-state --region us-east-1
3. Copy the example variables file:
   cp terraform/terraform.tfvars.example terraform/terraform.tfvars
4. Deploy infrastructure:
   ./scripts/deploy-infrastructure.sh

## CI/CD Pipeline

The infrastructure pipeline triggers automatically when changes are pushed
to the terraform/ directory on the main branch.

- Pull Request: runs terraform plan only
- Push to main: runs terraform plan then terraform apply

## Monitoring

CloudWatch Log Groups created:
- /starttech/starttech/app    - application logs
- /starttech/starttech/nginx  - web server logs
- /starttech/starttech/system - system logs

All logs are retained for 30 days.
