output "webec2-pub" { 
    value = aws_instance.mywebinstance.public_ip
  
}