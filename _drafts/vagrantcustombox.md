# Making your own box for Vagrant on OS X

1. install packer
1. get a packer template for building vagrant boxes
1. setup Atlas authorization by exporting an API token
1. verify access

{% highlight bash %}
brew install packer
git clone "https://github.com/hashicorp/atlas-packer-vagrant-tutorial.git"
cd atlas-packer-vagrant-tutorial
export ATLAS_TOKEN="PUT_TOKEN_HERE"
curl "https://atlas.hashicorp.com/ui/tutorial/check?access_token=$ATLAS_TOKEN"

{% endhighlight %}
