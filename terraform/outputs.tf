output "alb_dns_name" {
  description = "ALB DNS name - use this as your backend API URL"
  value       = module.compute.alb_dns_name
}

output "s3_bucket_name" {
  description = "S3 bucket name for frontend deployment"
  value       = module.storage.s3_bucket_name
}

output "redis_endpoint" {
  description = "Redis endpoint for backend configuration"
  value       = module.storage.redis_endpoint
}

output "autoscaling_group_name" {
  description = "ASG name for deployment scripts"
  value       = module.compute.autoscaling_group_name
}

output "app_log_group_name" {
  description = "CloudWatch log group for app logs"
  value       = module.monitoring.app_log_group_name
}
