# Configure the AWS Provider
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

# Instance

resource "aws_instance" "SonarQube" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.sonarqube-sg}"]
  subnet_id                   = "${var.subnet}"
  private_ip                  = "${var.private_ip}"
  associate_public_ip_address = "${var.associate_public_ip}"
  tags {
    Name = "SonarQube"
  }
}
