resource "aws_security_group_rule" "ingress-rule" {
  type              = "ingress"
  security_group_id = "${aws_security_group.sonarqube-sg}"
  count             = "${length(var.ports)}"
  from_port         = "${element(var.ports, count.index)}"
  to_port           = "${element(var.ports, count.index)}"
  protocol          = "${element(var.proto, count.index)}"
  cidr_blocks       = ["${element(var.cidr, count.index)}"]
  depends_on        = ["aws_security_group.vm-sg"]
}

resource "aws_security_group_rule" "egress-rule" {
  type              = "egress"
  security_group_id = "${aws_security_group.sonarqube-sg}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  depends_on        = ["aws_security_group.vm-sg"]
}


resource "aws_security_group" "sonarqube-sg" {
  name        = "${var.app_name}-${var.env_name}-vm"
  description = "managed with Terraform"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name  = "${var.app_name}-${var.env_name}-vm"
    Env   = "${var.env_name}"
  }
}
