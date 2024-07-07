provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWLH2FHIU4576D4PU"
  secret_key = "C482xoqOcIiS+RYWMTJCKXfSmKV2AW2WEYbC9esU"
}

resource "aws_instance" "rhel9" {
  ami           = "ami-08a9e811ec80449b9" # Replace with your RHEL 8.10 AMI ID
  instance_type = "t2.micro"
  key_name      = "C:\Users\SujSingh\access-key.pem"
  tags = {
    Name = "rhel9-devopslab"
  }

  connection {
    type     = "ssh"
    user     = "root"
    password = "changeme"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'root:changeme' | chpasswd"
    ]
  }
}
