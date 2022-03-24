

<h1>
WORK IN PROGRESS
</h1>

- Install requirements
- Add hosts
- SSH KEYS
- Execute
- Replace Config

# Ansible provisioning of a Debian cluster

To easily configure a self-hosted *Kubernetes* cluster we can use [Ansible](https://www.ansible.com/).


> Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.
> It uses no agents and no additional custom security infrastructure, so it's easy to deploy - and most importantly, it uses a very simple language (YAML, in the form of Ansible Playbooks) that allow you to describe your automation jobs in a way that approaches plain English.
> 
> &mdash; <cite>[How Ansible Works | Ansible.com](https://www.ansible.com/overview/how-ansible-works)</cite>
 


## Requirements

Instructions on how to install ansible are available [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).


## Preparation

In order to provision the VMs we need some preparation.

1. Install Ansible (refer to the respective documentations)
   
2. Populate the `hosts.ini` file 
   
    2.1. Vagrant 

    2.2. Else
  
   
3. SSH KEYS
   
    2.1. Vagrant 

    2.2. Else


## Usage

After preparing the environment is just a matter of running the following command in the ansible directory and waiting a couple of minutes:

```powershell
ansible
``` 

<br>

### Output

Cluster 

 