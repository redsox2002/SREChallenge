resource "aws_security_group" "web" {
  name = "web-group"
  tags {
    Name = "web-group"
  }
  description = "Security group for web servers"
  vpc_id = "${aws_vpc.terraformmain.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "redis" {
  name = "redis-group"
  tags {
    Name = "redis-group"
  }
  description = "Security group for redis servers"
  vpc_id = "${aws_vpc.terraformmain.id}"

  ingress {
    from_port = 6379
    to_port = 6379
    protocol = "tcp"
    security_groups = ["${aws_security_group.web.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "db" {
  vpc_id = "${aws_vpc.terraformmain.id}"
  name = "db-group"
  description = "db security group"

  ingress {
    security_groups = ["${aws_security_group.web.id}"]
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
  }

  tags = {
    Name = "db-group"
  }
}
