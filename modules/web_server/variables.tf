variable "db_address"{}
variable "db_port" {}

variable "server_port" {
    default = 3000
}

variable "instance_security_group_name" {
  description = "The name of the security group for the EC2 Instances"
  type        = string
  default     = "terraform-example-instance"
}

variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "terraform-example-alb"
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
}

variable "instance_type" {
  description = "The type of EC2 Instances to run (e.g. t2.micro)"
  default = "t2.micro"
}

variable "min_size" {
  description = "The minimum number of EC2 Instances in the ASG"
  default = 1
}

variable "max_size" {
  description = "The maximum number of EC2 Instances in the ASG"
  default = 1
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "terraform-asg-example"
}
