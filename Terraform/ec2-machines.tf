resource "aws_instance" "nginx-server" {
  count = "${var.count}"

  ami = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.nginx.id}"]
  key_name = "${var.key_name}"

  root_block_device {
    volume_size = "8"
  }

  tags {
    name = "nginx-server-0${count.index}"
  }

  provisioner "file" {
    source = "provision_server.sh"
    destination = "/tmp/provision_server.sh"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("nginx-test-key")}"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision_server.sh",
      "/tmp/provision_server.sh",
    ]

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("nginx-test-key")}"
    }
  }
}
