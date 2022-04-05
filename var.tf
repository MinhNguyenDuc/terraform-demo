variable singapore_region {
  type        = string
  description = "Singapore region code"
}

variable vpc_name {
  type        = string
  default     = "demo-vpc-1"
}

variable subnet_name {
  type        = string
  default     = "demo-subnet-1"
  description = "description"
}
