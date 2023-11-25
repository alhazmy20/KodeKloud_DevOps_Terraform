module "eu-region-deploy" {
  source               = "../modules/AWS-Services"
  region               = lookup(var.region, terraform.workspace)
  admin_username       = "test-admin"
  admin_tag_department = "hr"
  dev_users            = ["User1", "User2"]
  dev_user1            = "User1"
  dev_user2            = "User2"
  ami_id               = lookup(var.ami_id, terraform.workspace)
  az1_name             = lookup(var.az1_name, terraform.workspace)
  az2_name             = lookup(var.az2_name, terraform.workspace)
}
