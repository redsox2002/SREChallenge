resource "aws_db_instance" "web-server" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.22"
  instance_class       = "db.t2.micro"
  name                 = "mytestdb"
  username             = "foo"
  password             = "${var.mysql_password}"
  parameter_group_name = "web-server.mysql5.7"
  db_subnet_group_name = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.db.id}"]
}