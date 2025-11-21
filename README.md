# DevOps Assignment

This project contains the full solution for a DevOps assignment
involving EC2 setup, user configuration, Nginx hosting, system
monitoring automation, and integration with AWS CloudWatch Logs.

## Part 1: EC2 Setup & User Configuration

### 1. Launch EC2 Instance

-   Instance Type: t2.micro (Ubuntu 22.04 LTS)
-   Security Groups: SSH (22), HTTP (80)

### 2. SSH into Instance

    ssh -i "~/Downloads/nitesh-key.pem" ubuntu@<PUBLIC-IP>

### 3. Create User

    sudo adduser devops_intern
    sudo usermod -aG sudo devops_intern

### 4. Passwordless Sudo

    sudo visudo
    devops_intern ALL=(ALL) NOPASSWD:ALL

### 5. Change Hostname

    sudo hostnamectl set-hostname nitesh-devops
    sudo nano /etc/hosts
    127.0.1.1 nitesh-devops

## Part 2: Nginx & Metadata Page

Install nginx:

    sudo apt update
    sudo apt install nginx -y

Create HTML page at `/var/www/html/index.html` containing: - Name -
Instance ID - Server Uptime

## Part 3: system_report.sh Monitoring Script

The script logs: - Uptime - CPU - Memory - Disk - Top 3 CPU processes

Output stored in `/var/log/system_report.log`.

## Part 4: CloudWatch Integration

Commands used:

    aws logs create-log-group --log-group-name /devops/intern-metrics
    aws logs create-log-stream --log-group-name /devops/intern-metrics --log-stream-name system-report-stream
    aws logs put-log-events --log-group-name /devops/intern-metrics --log-stream-name system-report-stream ...

## Part 5: Cleanup

Terminate EC2 instance after completing the assignment.

## Files Included

-   README.md
-   system_report.sh
-   cron/systemd configs
