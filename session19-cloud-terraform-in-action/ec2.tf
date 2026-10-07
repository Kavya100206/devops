# Data source to fetch latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 Web Application Server
resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  # Bootstrap cloud-init script
  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx
              systemctl start nginx

              cat <<HTML > /usr/share/nginx/html/index.html
              <!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <title>Cloud Architecture Demo - Terraform</title>
                  <style>
                      body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background: #0f172a; color: #f8fafc; padding: 40px; }
                      .card { background: #1e293b; border-radius: 12px; padding: 30px; max-width: 700px; margin: 0 auto; box-shadow: 0 10px 25px rgba(0,0,0,0.5); border: 1px solid #334155; }
                      h1 { color: #38bdf8; margin-top: 0; }
                      .badge { display: inline-block; padding: 4px 10px; background: #0284c7; color: white; border-radius: 6px; font-weight: bold; }
                      .details { margin-top: 20px; line-height: 1.8; }
                  </style>
              </head>
              <body>
                  <div class="card">
                      <span class="badge">Session 19: Cloud & Terraform</span>
                      <h1>🚀 Automated Cloud Architecture Live</h1>
                      <div class="details">
                          <p><strong>Student:</strong> ${var.owner_name} (<code>${var.student_roll}</code>)</p>
                          <p><strong>Provisioned By:</strong> HashiCorp Terraform IaC</p>
                          <p><strong>Resources:</strong> VPC + Public Subnet + Internet Gateway + Security Group + EC2 (Amazon Linux 2023) + S3</p>
                          <p><strong>Region:</strong> ${var.aws_region}</p>
                          <p><strong>Status:</strong> Healthy & Serving Traffic</p>
                      </div>
                  </div>
              </body>
              </html>
              HTML
              EOF

  # Explicit dependency declaration
  depends_on = [
    aws_internet_gateway.igw,
    aws_s3_bucket.app_storage
  ]

  tags = {
    Name = "${var.project_name}-web-server"
    Role = "PublicWebServer"
  }
}
