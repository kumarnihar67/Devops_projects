variable "region" {
  default = "us-east-1"
}

variable "public_key_path" {
  description = "Path to your public key"
  default     = "~/.ssh/id_rsa.pub"
}

