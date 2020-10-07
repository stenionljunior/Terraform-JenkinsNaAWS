output "public_ip" {
  description = "Lista o IP publico que está associado a instância"
  value       = aws_instance.app.*.public_ip
}