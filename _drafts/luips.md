# Installing and using Lupis framework

# Ubunt 15

## install openresty 1.9.7.3

{% highlight bash %}
sudo apt-get install libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential perl make libssl-dev \
    postgresql-9.4 postgresql-server-dev-9.4 postgresql-contrib-9.4
    
./configure --with-cc-opt="-I/usr/include/openssl -I/usr/include" \ 
--with-ld-opt="-L/usr/include/openssl -L/usr/include" -j8 \ 
--prefix=/opt/openresty-1.9.7.3 \
--with-pcre-jit \
--with-ipv6 \
--with-http_postgres_module

# make with 4 spare cpu power
make -j4
# install
make install
{% endhighlight %}
