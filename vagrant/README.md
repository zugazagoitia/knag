# Vagrant Development Enviroment on Windows

In order to provide a set of virtual hosts to deploy our *Kubernetes* cluster with *Ansible* we can provision some VMs using [Vagrant](https://www.vagrantup.com/).


> Vagrant provides easy to configure, reproducible, and portable work environments built on top of industry-standard technology and controlled by a single consistent workflow to help maximize the productivity and flexibility of you and your team.
> 
> To achieve its magic, Vagrant stands on the shoulders of giants. Machines are provisioned on top of VirtualBox, VMware, AWS, or any other provider. Then, industry-standard provisioning tools such as shell scripts, Chef, or Puppet, can automatically install and configure software on the virtual machine.
> 
> &mdash; <cite>[Introduction - Vagrant by HashiCorp](https://www.vagrantup.com/intro)</cite>
 


## Requirements

| Name  | Link | Version| 
|:---   | ---- |    ---:|
| Hyper-V | [Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) | Bundled with Windows |
| OpenSSH Client | https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse | Bundled with Windows|
| Vagrant | [Download](https://www.vagrantup.com/downloads) | Latest
| Vagrant Host Manager Plugin | [Github Repo](https://github.com/devopsgroup-io/vagrant-hostmanager) | N/A


## Preparation

In order to provision the VMs we need some preparation.

1. Install *Vagrant* and enable *Hyper-V* (refer to their respective documentations)
   
2. Ensure you have a valid LAN/WLAN conection and that there is no *External Virtual Switch* conected to your network adapter.
   
3. Using powershell, install the Vagrant Host Manager Plugin: 
   
    ```powershell
    vagrant plugin install vagrant-hostmanager  
    ```
4. Run the `create-hyperV-virtual-switch.ps1` script in this folder to create the *External Virtual Switch*, you will be prompted to choose which network adapter to bind it.

5. Edit the `WORKER_NODES` constant at the start of the `Vagrantfile` to your preference. For the master node, 4GB of ram and 2CPUs will be allocated. For each worker node, 2GB and 1CPU. This values can be changed using the corresponding constants.

6. In order for Ansible to connect to our VMs it's required to have a SSH key beforehand, with the object of inserting it into the VMs. The public key must be available on `%userprofile%/.ssh/id_rsa.pub`.

    This can be done by enabling [OpenSSH Client](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) and generating a key:
    ```powershell
    ssh-keygen 
    ```


## Usage

After preparing the environment is just a matter of running the following command in the vagrant directory and waiting a couple of minutes:
```powershell
vagrant up
``` 
To destroy all the VMs, just run:
```powershell
vagrant destroy --force
``` 
<br>

### What's the outcome?
By default all VMs will register using DHCP through the specified network adapter, their IPs are outputed while the VMs create.

VMs will also broadcast themselves through [mDNS/DNS-SD](https://en.wikipedia.org/wiki/Zero-configuration_networking#DNS-SD_with_multicast). The master node is available at `master-node` and the worker nodes at `worker-node01  worker-node02 ... worker-node0N`. This will be usefull when we provision them using ansible. 

 




