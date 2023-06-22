#!/bin/bash

# Update system packages
sudo apt update
sudo apt upgrade -y

# Install Java Development Kit (JDK)
sudo apt install -y default-jdk

# Download Apache Tomcat 8.5
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.69/bin/apache-tomcat-8.5.69.tar.gz

# Extract the downloaded archive
tar -xf apache-tomcat-8.5.69.tar.gz

# Move the extracted directory to /opt
sudo mv apache-tomcat-8.5.69 /opt/tomcat8

# Create a Tomcat service file
sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
[Unit]
Description=Tomcat 8.5
After=network.target

[Service]
Type=forking
Environment=CATALINA_PID=/opt/tomcat8/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat8
Environment=CATALINA_BASE=/opt/tomcat8
ExecStart=/opt/tomcat8/bin/startup.sh
ExecStop=/opt/tomcat8/bin/shutdown.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd configuration
sudo systemctl daemon-reload

# Enable Tomcat service to start on system boot
sudo systemctl enable tomcat.service

# Start Tomcat service
sudo systemctl start tomcat.service
