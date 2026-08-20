variable "env_name" {
  type        = string
  description = "Название окружения (develop, stage, prod)"
}

variable "zone" {
  type        = string
  description = "Зона доступности для подсети"
}

variable "cidr" {
  type        = string
  description = "CIDR блок для подсети (например, 10.0.1.0/24)"
}