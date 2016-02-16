---
layout: post
title: "Chef and Vagrant Practice"
description: "A tutorial on how to configure vagrant in various ways with Chef 12"
tags: [sysadmin, chef]
image:
  feature: 8273732260_46ea8166b3_o.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## What

To practice with chef and vagrant.

## Why

To observe changes and have a test setup for you to experiment with your existing or planned infrastructure.

## How

### Install stuff

1. https://www.vagrantup.com/
1. https://www.virtualbox.org/wiki/Downloads

### Steps for creating our personal chef server

Here is our list of steps:

* Make a directory on our computer to work from
* Add a box (downloaded if necessary)
* Create instances and run tests

#### Making a directory to work

{% highlight bash %}
mkdir -p ~/chefwork/chefserver
{% endhighlight %}

Fill up your Gemfile with the following:

{% highlight ruby %}
source "https://rubygems.org"

gem 'chef'
gem 'berkshelf'
gem 'knife-solo'
{% endhighlight %}

#### Create your knife environment

{% highlight bash %}
cd ~/chefwork/chefserver
knife solo init .
{% endhighlight %}

Fill the file ~/chefwork/chefserver/.chef/knife.rb with the contents of:

{% highlight ruby %}
cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
encrypted_data_bag_secret ".chef/encrypted_data_bag_secret"

knife[:berkshelf_path] = "cookbooks"
{% endhighlight %}

Now run your bundler to install your gems

{% highlight bash %}
bundle install
{% endhighlight %}

Fill the file ~/chefwork/chefserver/Berksfile with the contents of:

{% highlight ruby %}
source "https://supermarket.chef.io"

cookbook 'chef-server'
{% endhighlight %}

Install your berks:

{% highlight bash %}
berks vendor cookbooks
{% endhighlight %}

#### Creating your vagrant file

Change to your new directory and create a vagrant file:

{% highlight bash %}
cd ~/chefwork/chefserver
vagrant init .
{% endhighlight %}

Fill up the file ~/chefwork/chefserver/Vagrantfile with:

{% highlight ruby %}
# -*- mode: ruby -*-
# vi: set ft=ruby :

# require 'chef'
# require 'json'

Chef::Config.from_file(File.join(File.dirname(__FILE__), '.chef', 'knife.rb'))

chef_server_json = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'chef-server.example.com.json').read)

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  config.vm.define :chef_server do |chef_server|
    chef_server.vm.box = "chef/centos-6.6"
    chef_server.vm.network "private_network", ip: "10.33.33.33"


    chef_server.vm.provision :chef_solo do |chef|
      ## to add a recipe manually
      # chef.add_recipe "chef-server"
      chef.log_level = "debug"
      chef.cookbooks_path = Chef::Config[:cookbook_path]
      chef.roles_path = Chef::Config[:role_path]
      chef.data_bags_path = Chef::Config[:data_bag_path]
      chef.environments_path = Chef::Config[:environment_path]
      chef.run_list = chef_server_json.delete('run_list')
      chef.json = chef_server_json 
    end
  end
end

{% endhighlight %}

....

#### Using Chef 11 Server

....

#### Using Chef 12 Server

Chef 12 asks that you create a user to generate the admin.pem certificate. To do so, login to the server and create the user:

{% highlight bash %}
vagrant ssh
# syntax:
# chef-server-ctl user-create user_name first_name last_name email password --filename FILE_NAME
chef-server-ctl user-create aaron Aaron Addleman aaronaddleman@gmail.com changeme --filename /tmp/aaron.pem
{% endhighlight %}

Then create your company:

{% highlight bash %}
vagrant ssh
chef-server-ctl org-create short_name full_organization_name --association_user user_name --filename FILE_NAME
{% endhighlight %}

Just in case you create an organization and have an error with adding a user, the organization gets added anyways, here is how to list existing organizations and add a user:

{% highlight bash %}
# list organizations
chef-server-ctl org-list
# list all organizations
chef-server-ctl org-list --all-orgs

# add a user to an organization
chef-server-ctl org-user-add ORG_NAME USER_NAME 
# add a user to an organization with admin status
chef-server-ctl org-user-add ORG_NAME USER_NAME -a

# incase you want to remove a user
chef-server-ctl org-user-remove ORG_NAME USER_NAME
{% endhighlight %}

To enable additional tools:

{% highlight bash %}
# Use Chef management console to manage data bags, attributes, run-lists, roles, environments, and cookbooks from a web user interface.
chef-server-ctl install opscode-manage
opscode-manage-ctl reconfigure
chef-server-ctl reconfigure
#
# Use Chef push jobs to run jobs—an action or a command to be executed—against nodes independently of a chef-client run.
chef-server-ctl install opscode-push-jobs-server
opscode-push-jobs-server-ctl reconfigure
chef-server-ctl reconfigure
#
# Use Chef replication to asynchronously distribute cookbook, environment, role, and data bag data from a single, primary Chef server to one (or more) replicas of that Chef server.
chef-server-ctl install chef-sync
chef-sync-ctl reconfigure
chef-server-ctl reconfigure
#
# Use Chef reporting to keep track of what happens during every chef-client runs across all of the infrastructure being managed by Chef. Run Chef reporting with Chef management console to view reports from a web user interface.
chef-server-ctl install opscode-reporting
opscode-reporting-ctl reconfigure
chef-server-ctl reconfigure
{% endhighlight %}

#### Checkout your server!

Point your browser to https://10.33.33.33/login to see the chef server gui. Login with your created credentials earlier from the command "chef-server-ctl user-create ...". Have fun exploring around but dont get used to it. Better to do everything with knife or another cli utility as most places lock the GUI down or disable it for performance. When your done come back here and do more stuff.


#### Get your certs

When logged into the Chef Admin WebUI:

1. Click on the tab "Administration"
1. Click on the organization created from the command earlier "chef-server-ctl org-create ..."
1. On left side click on "Starter Kit"
1. Observe warning of user and organziation keys will be reset (this is okay as we are just generating new scripts)
1. Click on "Proceed"
1. Move the download to your ~/chefwork/chefserver/
1. Unzip the zip file to the directory and you will get:
  * a new .chef/knife.rb
  * the right pem files
  * example of a role
  * example of a cookbook

Lets check to make sure your certs and knife.rb file are working:

{% highlight bash %}
aaron:my-server-cloud aaddleman$ knife ssl check
Connecting to host 10.33.33.33:443
ERROR: The SSL certificate of 10.33.33.33 could not be verified
Certificate issuer data: /C=US/ST=WA/L=Seattle/O=YouCorp/OU=Operations/CN=10.33.33.33/emailAddress=you@example.com

Configuration Info:

OpenSSL Configuration:
* Version: OpenSSL 1.0.2 22 Jan 2015
* Certificate file: /usr/local/etc/openssl/cert.pem
* Certificate directory: /usr/local/etc/openssl/certs
Chef SSL Configuration:
* ssl_ca_path: nil
* ssl_ca_file: nil
* trusted_certs_dir: "/Users/aaddleman/Documents/work/chef/cooking-infrastructure/my-server-cloud/.chef/trusted_certs"

TO FIX THIS ERROR:

If the server you are connecting to uses a self-signed certificate, you must
configure chef to trust that server's certificate.

By default, the certificate is stored in the following location on the host
where your chef-server runs:

  /var/opt/opscode/nginx/ca/SERVER_HOSTNAME.crt

Copy that file to your trusted_certs_dir (currently: /Users/aaddleman/Documents/work/chef/cooking-infrastructure/my-server-cloud/.chef/trusted_certs)
using SSH/SCP or some other secure method, then re-run this command to confirm
that the server's certificate is now trusted.
{% endhighlight %}

Uhoh, this is not looking good, lets fix it with:

{% highlight bash %}
# TODO: replace this with an scp command
cd ~/chefwork/chefserver/
vagrant ssh
sudo su
cat /var/opt/opscode/nginx/ca/10.33.33.33.crt
{% endhighlight %}

Take the cert and make a file that was suggested from above output (mine was /Users/aaddleman/Documents/work/chef/cooking-infrastructure/my-server-cloud/.chef/trusted_certs/10.33.33.33.crt)

Ok now thats done, lets check ssl certs again:

{% highlight bash %}
$ knife ssl check
Connecting to host 10.33.33.33:443
Successfully verified certificates from `10.33.33.33'
{% endhighlight %}

That looks better!

#### Lets add a cookbook

Lets go with adding the cookbook "nginx" to the berksfile:

{% highlight ruby %}
source "https://supermarket.chef.io"

cookbook 'chef-server'
cookbook 'nginx'
cookbook 'yum'
{% endhighlight %}

and vendor them down to the "cookbooks" path!

{% highlight bash %}
berks vendor cookbooks
{% endhighlight %}

now thats done, we need to upload the cookbooks to the chef server

{% highlight bash %}
knife cookbook upload -a
{% endhighlight %}

#### Add a node to the chef server with vagant

Lets start by adding a role for nginx, by making a file "roles/nginx.json" with contents of:

{% highlight json %}
{
  "name": "nginx",
  "description": "The base role for systems that serve web server",
  "chef_type": "role",
  "json_class": "Chef::Role",
  "default_attributes": {
    "nginx": {
      "install_method": "source",
      "version": "1.6.0",
      "default_site_enabled": true,
      "source": {
        "url": "http://nginx.org/download/nginx-1.6.0.tar.gz"
      },
      "worker_rlimit_nofile": 30000,
      "worker_connections": 4000
    }
  },
  "run_list": [
    "recipe[nginx]"
  ]
}
{% endhighlight %}

And now upload the role to the chef server:

{% highlight bash %}
knife role from file roles/nginx.json
{% endhighlight %}

Change your Vagrantfile to the following (the ...'s signify there is code but has been removed to keep the post shorter):

{% highlight ruby %}
# -*- mode: ruby -*-
# vi: set ft=ruby :

# require 'chef'
# require 'json'

Chef::Config.from_file(File.join(File.dirname(__FILE__), '.chef', 'knife.rb'))

chef_server_json = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'chef-server.example.com.json').read)

Vagrant.configure(2) do |config|

  ... 

  config.vm.define :chef_server do |chef_server|

    chef_server.vm.provision :chef_solo do |chef| 
      ...
    end    
  end

  # first client
  config.vm.define :chef_first_client do |chef_client|
    chef_client.vm.box = "chef/centos-6.6"
    chef_client.vm.network "private_network", ip: "10.33.33.34" 

    chef_client.vm.provision :chef_first_client do |chef| 
      chef.chef_server_url = Chef::Config[:chef_server_url] 
      chef.validation_key_path = Chef::Config[:validation_key] 
      chef.validation_client_name = Chef::Config[:validation_client_name] 
      chef.node_name = 'first.example.com' 
      chef.delete_node = true 
      chef.delete_client = true
    end
  end

end
{% endhighlight %}

Create your chef_first_client by running:

{% highlight bash %}
vagrant up chef_first_client
{% endhighlight %}

My output I got was of the following:

{% highlight bash %}
aaron:my-server-cloud aaddleman$ vagrant provision chef_first_client
==> chef_first_client: Running provisioner: chef_client...
==> chef_first_client: Detected Chef (latest) is already installed
==> chef_first_client: Creating folder to hold client key...
==> chef_first_client: Uploading chef client validation key...
Generating chef JSON and uploading...
==> chef_first_client: Warning: Chef run list is empty. This may not be what you want.
==> chef_first_client: Running chef-client...
==> chef_first_client: [2015-03-23T22:28:29+00:00] INFO: Forking chef instance to converge...
==> chef_first_client: [2015-03-23T22:28:29+00:00] INFO: *** Chef 12.1.2 ***
==> chef_first_client: [2015-03-23T22:28:29+00:00] INFO: Chef-client pid: 5382
==> chef_first_client: [2015-03-23T22:28:30+00:00] INFO: Client key /etc/chef/client.pem is not present - registering
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: HTTP Request Returned 404 Object Not Found: error
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: Run List is []
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: Run List expands to []
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: Starting Chef Run for first.example.com
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: Running start handlers
==> chef_first_client: [2015-03-23T22:28:31+00:00] INFO: Start handlers complete.
==> chef_first_client: [2015-03-23T22:28:33+00:00] INFO: Loading cookbooks []
==> chef_first_client: [2015-03-23T22:28:33+00:00] WARN: Node first.example.com has an empty run list.
==> chef_first_client: [2015-03-23T22:28:33+00:00] INFO: Chef Run complete in 2.524991336 seconds
==> chef_first_client: [2015-03-23T22:28:33+00:00] INFO: Running report handlers
==> chef_first_client: [2015-03-23T22:28:33+00:00] INFO: Report handlers complete
==> chef_first_client: [2015-03-23T22:28:33+00:00] INFO: Sending resource update report (run-id: d3472516-8307-4ea3-bf8e-e4184338c26f)
{% endhighlight %}

From the looks of this output, I think we have a new node registered with our Chef Server! Whohoo!!

#### Add role to registerd node

...

==> chef_first_client: Error executing action `create` on resource 'remote_file[http://nginx.org/download/nginx-1.6.0.tar.gz]'
