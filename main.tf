
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "iftach_ec2" {
  ami           = "ami-080e1f13689e07408"
  instance_type = "t2.micro"
  key_name      = "lab-web"
  # subnet_id              = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  user_data = <<-EOF
#!/bin/bash
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
echo "Pulling and running Docker container..."
sudo docker pull iftachbt/web-project:latest

echo "Fetching public IP address..."
REACT_APP_PUBLIC_IP=$(curl -s https://ipv4.icanhazip.com)

echo "Starting Docker container with public IP address..."
sudo docker run -d -p 5000:5000 -e "REACT_APP_PUBLIC_IP=$${REACT_APP_PUBLIC_IP}" iftachbt/web-project:latest
EOF
}
output "public_ip" {
  value = aws_instance.iftach_ec2.public_ip
}
