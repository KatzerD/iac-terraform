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

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type = string
  default = "backend-s3-enrique-cloud"
}

variable "acl" {
  description = "Permisos ACL para el bucket"
  type        = string
  default     = "private"
}

variable "enable_versioning" {
  description = "Habilitar el versionado del bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Etiquetas para el bucket"
  type        = map(string)
  default     = {
    Name        = "S3 Bucket"
    Environment = "Dev"
  }
}