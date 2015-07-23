---
layout: post
title: "Simple administration with IBM MQ"
description: "Simple administration with IBM MQ"
tags: [programming]
image:
  feature: 9553056715_0a418a1852_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## Installation

http://www-01.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/com.ibm.mq.ins.doc/q008640_.htm?lang=en

## Verification between sender and receiver

http://www-01.ibm.com/support/knowledgecenter/SSFKSJ_7.5.0/com.ibm.mq.ins.doc/q009250_.htm?lang=en

## Vagrant file

{% highlight ruby %}
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # config.vm.box = "."
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  # config.vm.network "public_network"
  # config.vm.synced_folder "../data", "/vagrant_data"

  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    #vb.memory = "2048"
  end

  config.vm.define :mq_ubuntu_trusty64 do |desktop|
    desktop.vm.box = "ubuntu/trusty64"
  end

  config.vm.define :mq_ubuntu1504_desktop do |desktop|
    desktop.vm.box = "ninthport/ubuntu1504-desktop"
  end

  config.vm.define :mq_centos_65 do |desktop|
    desktop.vm.box = "chef/centos-6.5"
  end

  config.vm.define :mq_centos_65 do |desktop|
    desktop.vm.box = "chef/centos-6.5"
  end

  config.vm.define :mq_centos_70 do |desktop|
    desktop.vm.box = "chef/centos-7.0"
  end

end
{% endhighlight %}