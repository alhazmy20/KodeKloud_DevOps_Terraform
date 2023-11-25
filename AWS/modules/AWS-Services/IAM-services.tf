# Admin Resources

resource "aws_iam_user" "create_admin_user" {
  name = var.admin_username
  tags = {
    "role"       = "admin"
    "department" = var.admin_tag_department
  }
}

resource "aws_iam_policy" "create_admin_policy" {
  name   = "Admin-Policy"
  policy = file("${path.module}/policies/grant_all_policy.json")
}


resource "aws_iam_user_policy_attachment" "assign_admin_policy" {
  user       = aws_iam_user.create_admin_user.name
  policy_arn = aws_iam_policy.create_admin_policy.arn
}

# Developers Resources

resource "aws_iam_user" "create_dev_users" {
  name  = var.dev_users[count.index]
  count = length(var.dev_users)
  tags = {
    role : "developer"
  }
}
resource "aws_iam_group" "create_devs_group" {
  name = "Developers"
}

resource "aws_iam_group_membership" "attach_devs_group" {
  group = aws_iam_group.create_devs_group.name
  name  = "developers-Membership"
  users = [
    var.dev_user1,
    var.dev_user2
  ]
}

resource "aws_iam_policy" "create_devs_policy" {
  name   = "Devs-Policy"
  policy = file("${path.module}/policies/grant_all_policy.json")
}

resource "aws_iam_group_policy_attachment" "attach_devs_policy" {
  group      = aws_iam_group.create_devs_group.name
  policy_arn = aws_iam_policy.create_devs_policy.arn
}
