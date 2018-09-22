  # Create a new load balancer
resource "aws_elb" "web-server-elb" {
  name               = "web-server-elb"
  security_groups = ["${aws_security_group.elb.id}"]
  subnets = ["${aws_subnet.PrivateAZA.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.web-server.*.id}"]
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "web-server-elb"
  }
}