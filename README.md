## Automated ELK Stack Deployment


The files in this repository were used to configure the network depicted below.

https://github.com/clayton24242/Cybersecuritybootcamp/blob/121a378b59a1c59b1bbad726d442420cc5693709/Diagram/Network.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _.yml____ file may be used to install only certain pieces of it, such as Filebeat.

  - elk.yml and filebeat-playbook.yml: Enter the playbook file are used to create and implement the elk server._

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

Load Balancing contributes heavily to the availability aspect of CIA. 

The ansible jumpbox serves as the primary point for completing any administrative tasks or monitorng  tasks. Administrators must connect to the Jumpbox before performung any task, this contributes heavily to security by reducing the surface area for attacks. Additionally, an ELK server has been intergrated into the environment and allows for the various containers and servers to be monitored for security issues, system traffic and log data.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
File beat monitors and collect logfile information, events and other metadata.
MetricBeat records performance and statistical metrics of the various systems and services it has been provisioned on

The configuration details of each machine may be found below.


| Name               | IP Address | Usage       | OS                   |   |
|--------------------|------------|-------------|----------------------|---|
| RedTeamVM(JumpBox) | 10.0.0.4   | Ansible     | Linux (ubuntu 18.04) |   |
| WEB-1(DVWA)        | 10.0.0.6   | Docker-DVWA | Linux (ubuntu 18.04) |   |
| WEB-2(DVWA)        | 10.0.0.7   | Docker-DVWA | Linux (ubuntu 18.04) |   |
| ELk-Server         | 10.1.0.5   | Elk         | Linux (ubuntu 18.04) |   |
|                    |            |             |                      |   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
My Personal home IP

Machines within the network can only be accessed by Jumpbox.
I allow the Jumpbox to access my Elk Server, its I.P is 10.0.0.4.

A summary of the access policies in place can be found in the table below.

| Name               | Publicly Accessible | Allowed IP Addresses |
|--------------------|---------------------|----------------------|
| RedTeamVM(JumpBox) | YES                 | Personal IP          |
| WEB-1(DVWA)        | NO                  | 10.0.0.4             |
| WEB-2(DVWA)        | No                  | 10.0.0.4             |
| ELk-Server         | NO                  | 10.0.0.4             |
|                    |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
Ansible is easy to use  and can  configure and deploy numerous containers quickly and with minimal effort.

The playbook implements the following tasks:

Create and Deploy a new VM that will serve as our Elk Server. 

Download and configure an docker ELK container.Note the host configuration file must be altered to include a new group called ELK servers and add the private IP of your server to this file. 

Launches and exposes the container on the ports specified in the elk configuration file.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/clayton24242/Cybersecuritybootcamp/blob/9ea4ab86862c1de1cfc1702f583b77fe3442b547/README/Images/Docker.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
[10.0.0.7, 10.0.0.6]

We have installed the following Beats on these machines:
Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat is a shipper for centralizing logs.It is lightweight and monitors logs for specified locations, collects log events and send them to a log collector like logstash or Elasticsearch.
Metricbeat  collects metrics from os' and services running on the spcified systems. Metricbeat then takes this data and forwards them to logstash or elasticsearch.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
opy the filebeat.yml and metricbeat.yml file to the /etc/ansible/roles/files/ directory.


Update the configuration files to include the Private IP of the Elk-Server to the ElasticSearch and Kibana sections of the configuration file.


Create a new ansible-playbook filebeat-playbook.yml in the /etc/ansible/roles/ directory that will install, drop in the filebeat.yml and metricbeat.yml files from the /etc/ansible/roles/files/ directory, uodate the configuration files, and start the service for both Filebeat and Metricbeat.


Run the playbook, and navigate to ELk-Server to check that the installation worked as expected. [docker ps]


The playbook is called filebeat-playbook.yml. You copy the file to the "/etc/ansible/" directory.


It is necessary to update the filebeat.yml file which is a configuration file that will be dropped into the Elk-Server during the run of the ansible-playbook. When you update the host.cfg file in the ansible directory you will need to create a new group called [elkservers] and add the Private IP of the Elk-Server to the group. Then when configuring the filebeat.yml file you need to designate the Private IP of the Elk-Server in lines 1106 and 1806 of the .yml file with the private IP.


Which URL do you navigate to in order to check that the ELK server is running? The URL to use to verify the Elk-Server is running is the Public IP (http://104.42.59.109:5601/)

ssh -i <sshkey> azureuser@<PublicIP>
sudo docker container list -a 
sudo docker start container <containername>
sudo docker attach user <username>
cd /etc/ansible/
ansible-playbook elk.yml (configures Elk-Server and starts the Elk container on the Elk-Server) 
cd /etc/ansible/roles/
ansible-playbook filebeat-playbook.yml (installs Filebeat and Metricbeat)
open a web browser and navigate to  (Elk-Server PublicIP:5601) This will bring up Kibana.
