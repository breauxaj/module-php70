# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/home/vagrant/php70", type: "rsync", rsync__exclude: ".git/"
  config.ssh.insert_key = false

  config.vm.define "amazon" do |amazon|
    amazon.vm.box     = 'breauxaj/amazon2017'
    amazon.vm.box_url = "http://vagrant.breaux.io/amazon2017.json"
    
    amazon.vm.provision :puppet do |puppet|
      puppet.manifests_path = "tests"
      puppet.manifest_file  = "vagrant.pp"
      puppet.options        = ["--modulepath", "/home/vagrant"]
    end
  end

end
