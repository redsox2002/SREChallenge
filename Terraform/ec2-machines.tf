resource "aws_instance" "web-server" {
  count = "${var.count}"

  connection {
    user = "ec2-user"
  }

# This allows Terraform to not update instances already created in EC2.
  lifecycle {
    ignore_changes = [
      "ami",
      "instance_type",
      "user_data",
    ]
  }

  ami = "${lookup(var.AmiLinux, var.region)}" # looks up the AMI specified the region you put in terraform apply
  instance_type = "${var.instance_type}"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}" # Adding the subnet in the subnets.tf file
  vpc_security_group_ids = ["${aws_security_group.web.id}"] # Adding the security group in the securitygroups.tf file
  key_name = "${var.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.s3_read_only.id}"

  root_block_device {
    volume_size = "8"
  }

  tags {
    Name = "web-server-0${count.index}" # Uses count.index to add to the count every time you scale up.
  }

  provisioner "file" {
    source = "provision_server.sh"
    destination = "/tmp/provision_server.sh"

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("web-test-key")}"
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
      private_key = "${file("web-test-key")}"
    }
  }
}
