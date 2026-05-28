variable "project_name" {
  description = "Project name"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Auto Scaling Group name"
  type        = string
}

variable "scale_up_policy_arn" {
  description = "Scale up policy ARN"
  type        = string
}

variable "scale_down_policy_arn" {
  description = "Scale down policy ARN"
  type        = string
}
