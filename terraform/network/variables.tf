variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "region" {
  type = string
  default = "us-west-1"
}

variable "vpc_cidr" {
  type = string
}
