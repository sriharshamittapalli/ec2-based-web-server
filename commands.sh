#!/usr/bin/env bash
#
# commands.sh
# Use this script to install and configure Apache on a fresh Amazon Linux EC2 instance.
# Usage: chmod +x commands.sh && ./commands.sh

# 1. Update system packages
sudo yum update -y

# 2. Install Apache
sudo yum install httpd -y

# 3. Start Apache and enable it to launch on boot
sudo systemctl start httpd
sudo systemctl enable httpd

# 4. Verify Apache status
sudo systemctl status httpd

# 5. Configure firewall
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# 6. Deploy a simple web page
echo "<h1>Welcome to My Web Server</h1>" | sudo tee /var/www/html/index.html

# 7. Print instance public IP for easy access
echo "---------------------------------------------"
echo "Your web server should now be running!"
echo "To access it, open your browser and navigate to:"
echo "http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
echo "---------------------------------------------"
