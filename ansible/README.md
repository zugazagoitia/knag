# Ansible provisioning of a Debian 11 Kubernetes cluster

To easily configure a self-hosted *Kubernetes* cluster we can use [Ansible](https://www.ansible.com/).


> Ansible is a radically simple IT automation engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and many other IT needs.
> It uses no agents and no additional custom security infrastructure, so it's easy to deploy - and most importantly, it uses a very simple language (YAML, in the form of Ansible Playbooks) that allow you to describe your automation jobs in a way that approaches plain English.
> 
> &mdash; <cite>[How Ansible Works | Ansible.com](https://www.ansible.com/overview/how-ansible-works)</cite>
 


## Requirements

- Ansible does NOT run on Windows, if needed [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) can be used.

- Instructions on how to install ansible are available [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

- An authorized SSH user and key must be provided. 


## Preparation

In order to provision the VMs we need some preparation.

1. Install Ansible (refer to the respective documentations)
   
2. Populate the `hosts.ini` file 
   
    <details>
      <summary>Vagrant dev setup</summary>
      
      Update the number of `workers` in the `hosts.ini` file, according to the `WORKER_NODES` variable in the `Vagrantfile`.

      Workers hostnames follow the syntax *worker-node0***N** being N the node number, there should be nodes from 1 to N.
      
    </details> 
    <br>
    <details>
      <summary>Real Environment</summary>
      
      Assuming that two or more Debian 11 hosts are available.

      Populate `master` with only one IP/FQHS corresponding to a host node and as many `workers` as you'd like.
      
    </details> 
    <br>
   
3. SSH Config
    - Add an authorized private key to your SSH agent.
    - Instructions for Windows/WSL can be found [here](https://www.scivision.dev/ssh-agent-windows-linux/).
    - Edit the `k3s.yaml` file indicating the ssh user by replacing the value in the `remote_user` variable, this is not required if using the Vagrant dev environment.  

4. Install the required ansible packages by running the following command in this directory.
   ```bash 
   ansible-galaxy install -r requirements.yml
   ```

## Usage

After preparing the environment is just a matter of running the following command in the ansible directory and waiting a couple of minutes:

```bash
ansible-playbook -i hosts.ini k3s.yaml
``` 


### Output

The result will be a configured Kubernetes Cluster. In order to access the cluster the credentials file is available in the same folder with the name `credentials.yaml`, before accessing the cluster edit the server address inside the file to that of the master node.
 