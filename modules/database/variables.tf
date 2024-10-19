variable "db_name" {
  type        = string
  description = "Nombre de la base de datos"
}

variable "db_username" {
  type        = string
  description = "Usuario de la base de datos"
  validation {
    condition     = length(var.db_username) > 0
    error_message = "El nombre de usuario de la base de datos no puede estar vacío"
  }
}

variable "db_password" {
  type        = string
  description = "Contraseña de la base de datos"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "Lista de IDs de subredes privadas donde se desplegará la base de datos RDS"
}

variable "allocated_storage" {
  type        = number
  description = "Cantidad de almacenamiento en GB para la base de datos RDS"
  default     = 20  # Valor por defecto
}

variable "engine" {
  type        = string
  description = "Motor de base de datos (postgres o mysql)"
  default     = "postgres"
}

variable "instance_class" {
  type        = string
  description = "Clase de instancia RDS"
  default     = "db.t4g.micro"
}

variable "security_group_id" {
  type        = string
  description = "ID del Security Group para permitir acceso a la base de datos"
}

variable "parameter_group_name" {
  type        = string
  description = "Nombre del grupo de parámetros para el motor de base de datos"
  default     = "default.postgres16"
}
