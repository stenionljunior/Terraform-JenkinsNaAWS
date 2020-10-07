resource "aws_security_group" "permitessh" {
  name        = "permitessh"
  description = "Permite SSH trafego de entrada"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Permite SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Permite_SSH"
  }
}

resource "aws_security_group" "acessojenkins" {
  name        = "Acesso Jenkins"
  description = "Permite acessar de forma publica o Jenkins na porta padrao 8080"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Porta padrao Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso_Jenkins"
  }
}