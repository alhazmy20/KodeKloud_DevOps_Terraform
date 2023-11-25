variable "region" {
  type = map(string)
  default = {
    "EU-Deploy" = "eu-central-1"
  }
}

variable "az1_name" {
  type = map(string)
  default = {
    "EU-Deploy" = "eu-central-1a"
  }
}

variable "az2_name" {
  type = map(string)
  default = {
    "EU-Deploy" = "eu-central-1b"
  }
}

variable "ami_id" {
  type = map(string)
  default = {
    "EU-Deploy" = "ami-0669b163befffbdfc"
  }
}
