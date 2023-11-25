variable "region" {
    type = string
  
}
variable "admin_username" {
  type = string
}
variable "admin_tag_department" {
  type = string
}

variable "dev_users" {
  type = list(string)
}

variable "dev_user1" {
  type = string
}
variable "dev_user2" {
  type = string
}

variable "az1_name" {
  type = string
}

variable "az2_name" {
  type = string
}

variable ami_id {
type = string
}
