data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


# data "aws_ami" "ansible_ami" {
#   owners      = ["self"]
#   most_recent = true

#   filter {
#     name   = "state"
#     values = ["available"]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["Ansible"]
#   }





resource "aws_instance" "myec2" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"
}

# resource "aws_instance" "myec2-1" {
#   ami           = data.aws_ami.ansible_ami.id
#   instance_type = "t2.micro"
# }
