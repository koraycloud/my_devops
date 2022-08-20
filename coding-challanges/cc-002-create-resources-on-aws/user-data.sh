#! /bin/bash
yum update -y
yum install httpd -y
cd /var/www/html
echo '
<h1>Hello World</h1>
' > index.html
systemctl start httpd
systemctl enable httpd