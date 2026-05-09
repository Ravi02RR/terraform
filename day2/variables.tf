variable "ec2_instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
  type        = string
}

variable "ec2_root_storage_size" {
  description = "this will be the size of the variable of the ec2 instance "
  default     = 12
  type        = number

}


variable "ec2_ami_id" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-0d13e2317a7e75c95" # ubantu
  type        = string

}

variable "ec2_name" {
  description = "The name tag for the EC2 instance"
  default     = "test-instance"
  type        = string

}
