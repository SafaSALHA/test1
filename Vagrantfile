Vagrant.configure("2") do |config|
  # Base Box
  config.vm.box = "generic/ubuntu2204"

  # VM 
  config.vm.define "vm" do |vm|
    # Configuration réseau : redirection du port 9999 (VM) vers 9999 (hôte)
    config.vm.network "forwarded_port", guest: 9999, host: 9999
    vm.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 2
    end
    vm.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end
end
