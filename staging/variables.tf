variable db_password {}

variable "t" {
  description = "The name to use for all the cluster resources"
  default = "webServer"
}

variable "env_name" {
  description = "The name of the environment"
  default = "staging"
}