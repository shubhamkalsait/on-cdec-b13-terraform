resource "aws_launch_configuration" "lc_home" {
    image_id = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
    security_groups = 
    user_data = <<EOF
    #!/bin/bash
    yum install httpd -y
    systemctl start httpd
    systmectl enable httpd
    echo "<h1> Hello Worl </h1> <br> <h2> Welcome to Cloudblitz </h2>
}