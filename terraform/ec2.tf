resource "aws_instance" "app" {
    ami                         = var.amiec2instancia
    instance_type               = var.tipoinstancia
    associate_public_ip_address = var.mapPublicIP
    key_name                    = var.namekeyec2
    subnet_id                   = aws_subnet.subnet_publica.id
    security_groups             = [ "${aws_security_group.permitessh.id}","${aws_security_group.acessojenkins.id}" ]

    tags = {
      Name = "Jenkins-Docker"
    }
    
    provisioner "file" {
      source      = "script.sh"
      destination = "/tmp/script.sh"
    }
    connection {
       type        = "ssh"
        user        = "ubuntu"
        private_key  = "${file("desafio.pem")}"
        host        = aws_instance.app.public_ip
        timeout     = "30s"
      }

    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh",
      ]
    }
}