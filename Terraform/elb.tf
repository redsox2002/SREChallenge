  # Create a new load balancer
resource "aws_elb" "web-server-elb" {
  name               = "web-server-elb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  subnets = ["${aws_subnet.PrivateAZA.*.id}"]

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
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = ["${aws_instance.web-server.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "web-server-elb"
  }
}