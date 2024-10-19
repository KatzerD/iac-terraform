variable "access_key" {
  description = "access_key"
  type = string
  sensitive = true
}

variable "secret_key" {
  description = "secret_key"
  type = string
  sensitive = true
}

variable "db_username" {
  type        = string
  description = "Username for the RDS database"
  default = "super"
}

variable "db_password" {
  type        = string
  description = "Password for the RDS database"
  default     = "SecurePassw0rd24"
  sensitive   = true
}