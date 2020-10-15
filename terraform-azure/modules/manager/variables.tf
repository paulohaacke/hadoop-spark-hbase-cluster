#variable "project" {
#  type = string
#}

variable "user_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "machine_count" {
  type = number
}

variable "key_ssh" {
  type = string
}

variable "hadoop_resource" {
  type = object({
    name = string
    location = string
  })
}

variable "subnet_id" {
  type = string
}
