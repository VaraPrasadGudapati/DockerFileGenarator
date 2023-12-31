#provider
provider "aws" {
    region ="us-east-1"
    access_key = var.accesskey 
    secret_key = var.seckey
}
#Resource of multiple applications
resource "aws_instance" "multiple_applications" {
    ami="ami-0fc5d935ebf8bc3bc"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name="MultipleAppIns"
    }
    key_name = "Multiple-keypair"

    connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("Multiple-keypair")    
 }
 provisioner "remote-exec" {
  inline = [
            "apt install unzip",
            "adduser sonarqube",
            "wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip -y",
            "unzip *",
            "chmod -R 755 /home/sonarqube/sonarqube-9.4.0.54424",
            "chown -R sonarqube:sonarqube /home/sonarqube/sonarqube-9.4.0.54424",
            "cd sonarqube-9.4.0.54424/bin/linux-x86-64/",
            "./sonar.sh start"           
  ] 
    }  
    
  }

#Create the keypair the  of applications
resource "aws_key_pair" "tf-key-pair" {
key_name = "Multiple-keypair"
public_key = tls_private_key.rsa.public_key_openssh
}
resource "tls_private_key" "rsa" {
algorithm = "RSA"
rsa_bits  = 4096
}
resource "local_file" "tf-key" {
content  = tls_private_key.rsa.private_key_pem
filename = "Multiple-keypair"
} 
#Security group of multiple applications
resource "aws_security_group" "allow_ssh" {
  name        = "MultipleApp"
  description = "Allow SSH inbound traffic"
  #vpc_id      = aws_vpc.vpc_demo.id

  ingress {
    # SSH Port 22 allowed from any IP
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # SSH Port 80 allowed from any IP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # SSH Port 3000 allowed from any IP
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # SSH Port 80 allowed from any IP
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    # SSH Port 80 allowed from any IP
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # It's allowed the port 3306
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
