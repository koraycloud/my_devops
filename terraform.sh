sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
mkdir terraform-files && cd terraform-files && touch main.tf outputs.tf provider.tf sec-gr.tf user-data.sh variables.tf