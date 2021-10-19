variable "do_token" {
  description = "token for DO"
  type        = string
  default     = "body_of_tocken"
}

variable "aws_access_key" {
  description = "access_key for AWS"
  type        = string
  default     = "body_of_key"
}

variable "aws_secret_key" {
  description = "secret_key for AWS"
  type        = string
  default     = "body_of_key"
}

variable "my_key" {
  description = "my personal public_key key"
  type        = string
  default     = "body_of_key"
}

variable "e-mail" {
  description = "my E-mail"
  type        = string
  default     = "ramires_at_inbox_ru"
}

variable "dev" {
  description = "Informationen zu VPC"
  type        = map(any)
  default = {
    names_von_do_vpc = ["denisubuntu", "deniscentos"]
  }
}

variable "zahlen" {
  description = "Zahlen VPC"
  type        = map(any)
  default = {
    num_von_vpc = "1"
  }
}
