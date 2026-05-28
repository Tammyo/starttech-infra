output "app_log_group_name" {
  description = "App log group name"
  value       = aws_cloudwatch_log_group.app.name
}

output "nginx_log_group_name" {
  description = "Nginx log group name"
  value       = aws_cloudwatch_log_group.nginx.name
}

output "system_log_group_name" {
  description = "System log group name"
  value       = aws_cloudwatch_log_group.system.name
}
