# scripts
Linux Scripts and Ansible Scripts for my Cybersecurity Class at University of Texas - Austin

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

	scripts/Diagrams/Red Team Configuration.drawio Final.pdf

These files have been tested and used to generate a live ELK deployment on Azure. 
They can be used to either recreate the entire deployment pictured above. 
Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

 	scripts/Ansible/Filebeat/filebeat-playbook.yml

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

What aspect of security do load balancers protect? 
They protect the servers from being overloaded with a lot of activity by spreading out the activity over the servers to maximize speed and utilization.

What is the advantage of a jump box?
The jump box's advandtage is it provides a single secure entry point to process all of the tasks needed across the system.  It keeps everything 
going through one location so that it is easier to keep track of.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metrics.
What does Filebeat watch for?  File beat watches out for new information and then relays that to the data log.

What does Metricbeat record?  It records metrics from the OS, as well as, metrics from services on the server.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function 	| IP Address | Operating System |
|----------|------------|------------|------------------|
| Jump Box | Gateway    | 10.1.0.4   |  Linux 		  |
| Web-1    | Web Server | 10.1.0.5   |  Linux           |
| Web-2    | Web Server | 10.1.0.6   |  Linux           |
| Elk      | Elk Server | 10.0.0.4   |  Linux           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box maching can accept connections from the Internet. To Access this machine is only allowed from the following IP Addresses:
108.85.129.244

Machines within the network can only be accessed by the Jump Box.

Which machine did you allow to access your ELK VM? Web-1

What was its IP address? 10.1.0.5

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No 	         	   |  108.85.129.244      |
| Elk      | No                  |  10.1.0.5            |
| Web-1    | No 	               |  10.1.0.4            |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

What is the main advantage of automating configuration with Ansible? It keeps everything streamlined and congruant leading to less mistakes.

The playbook implements the following tasks:
- Configuring Web VM with Docker
- Install pip3
- Install Docker python module
- Download and launch a docker web container
- Enable docker service

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.1.0.5
- Web-2 10.1.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml to Ansible container folder /etc/ansible/install-elk.yml
- Update the hosts file to include the Elk Server IP address: [elk] 10.0.0.4 ansible_python_interpreter=/usr/bin/python3
- Run the playbook, and navigate to Kibana to check that the installation worked as expected.


- Which file is the playbook? install-elk.yml
- Where do you copy it? You copy it to the /ect/ansible directory
- Which file do you update to make Ansible run the playbook on a specific machine? Update the hosts file 
- How do I specify which machine to install the ELK server on versus which to install filebeat on? By adding [elk] and [webservers] in your playbook
  will make sure the correct server has ELK or Filebeat.
- Which URL do you navigate to in order to check that the ELK server is running? http://40.71.23.100:5601/app/kibana
