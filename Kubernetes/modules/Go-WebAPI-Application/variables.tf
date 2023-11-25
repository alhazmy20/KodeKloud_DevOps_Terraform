variable "webapi_nodeport" {
  type    = number
  description = "This port will be used with the Node IP to call the API after deploying the cluster"
}

variable "MYSQL_ROOT_PASSWORD" {
  type    = string
  default = "root"
}

variable "MYSQL_DATABASE" {
  type    = string
  default = "inventory"
}
