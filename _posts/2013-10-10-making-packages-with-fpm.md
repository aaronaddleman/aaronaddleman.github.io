---
layout: post
title: "Building packages with `fpm`"
description: "If you enjoy making packages manually, then, your pretty cool. I however, like building packages with `fpm` because its a little easier. The following notes and steps were done on a CentOS 6 distrobution."
tags: [ruby, sysadmin]
image:
  feature: IMG_0449.jpg
  credit: Aaron Addleman
comments: true
share: true
---

## General

If you enjoy making packages manually, then, your pretty cool. I however, like building packages with `fpm` because its a little easier. The following notes and steps were done on a CentOS 6 distrobution.

## Building PHP rpm from source

1. download latest zip (5.5.4)
2. install any support packages you need
3. suggested support packages: `yum install gcc compat-readline5 compat-libtermcap mysql-devel httpd-devel curl-devel libxml2-devel libpng-devel openssl-devel pcre-devel libjpeg-devel libpng-devel freetype-devel openssl-devel zlib-devel rpm-build readline-devel` 
3. unzip archivegem
4. cd into archive
4. ./configure --with-apxs2=/usr/sbin/apxs --with-mysql
5. make
6. make install INSTALL_ROOT=/tmp/installdir
7. fpm -s dir -t rpm -n php-fpm -v 5.5.4 -C /tmp/installdir -p php-fpm_VERSION_ARCH.rpm -d openssl -d pcre -d bzip2 -d curl -d libjpeg -d libpng -d freetype -d gmp -d libxml2 usr

fpm -s dir -t rpm -n php-fpm -v 5.3.27 -C /tmp/installdir-5327 -p php-fpm_VERSION_ARCH.rpm -d openssl -d pcre -d bzip2 -d curl -d libjpeg -d libpng -d freetype -d gmp -d libxml2 usr

## Explanation of the commands

In step 1 we download the zip file from PHPs website and extract in step 2, then enter into the directory in step 3. Running `./configure ` in step 4 to build the key options for compiling. Step 5 is the actual compile and building of the application. Step 6 installes into a temporary directory so that we can build the package. Step 7 shows the `fpm` program and options to build a rpm package by using the source (`-s`) to be a directory and the target (`-t`) to be a rpm with the name (`-n`) set as "php-fpm" and a version (`-v`) with the value of 5.5.4 with XXXXX (`-C`) as "/tmp/installdir" and lastly using the directory "usr" from the "/tmp/installdir" to be all the files for being installed.


## zend configure
    './configure' '--prefix=/usr/local/zend' '--with-config-file-path=/usr/local/zend/etc' '--with-config-file-scan-dir=/usr/local/zend/etc/conf.d' '--disable-debug' '--enable-inline-optimization' '--disable-all' '--enable-libxml' '--enable-session' '--enable-spl' '--enable-xml' '--enable-hash' '--enable-reflection' '--with-pear' '--with-apxs2=/usr/local/zend/apache2/bin/apxs' '--with-layout=GNU' '--enable-filter' '--with-pcre-regex' '--with-zlib=/usr/local/zlib-1.2.3' '--enable-simplexml' '--enable-dom' '--with-libxml-dir=/usr/local/libxml2-2.7.7' '--with-openssl=/usr/include/openssl' '--enable-pdo' '--with-pdo-sqlite' '--with-readline=/usr/local/readline-5.2' '--with-iconv' '--with-sqlite3' '--disable-phar' '--enable-xmlwriter' '--enable-xmlreader'

## php 5.5.2 custom build
    './configure' '--prefix=/usr/local/php-5.5.2' '--with-config-file-path=/usr/local/php-5.5.2/etc' '--with-config-file-scan-dir=/usr/local/php-5.5.2/etc/conf.d' '--disable-debug' '--enable-inline-optimization' '--disable-all' '--enable-libxml' '--enable-session' '--enable-spl' '--enable-xml' '--enable-hash' '--enable-reflection' '--with-pear' '--with-apxs2=/usr/sbin/apxs' '--with-layout=GNU' '--enable-filter' '--with-pcre-regex' '--with-zlib=/usr' '--enable-simplexml' '--enable-dom' '--with-libxml-dir=/usr/local/libxml2-2.7.7' '--with-openssl' '--enable-pdo' '--with-pdo-sqlite' '--with-readline=/usr/local/readline-5.2' '--with-iconv' '--with-sqlite3' '--disable-phar' '--enable-xmlwriter' '--enable-xmlreader' '--with-mysql'

## php 5.5.8 custom build
    './configure' '--prefix=/usr/local/php-5.5.8' '--with-config-file-path=/usr/local/php-5.5.8/etc' '--with-config-file-scan-dir=/usr/local/php-5.5.8/etc/conf.d' '--disable-debug' '--enable-inline-optimization' '--disable-all' '--enable-libxml' '--enable-session' '--enable-spl' '--enable-xml' '--enable-hash' '--enable-reflection' '--with-pear' '--with-apxs2=/usr/sbin/apxs' '--with-layout=GNU' '--enable-filter' '--with-pcre-regex' '--with-zlib=/usr' '--enable-simplexml' '--enable-dom' '--with-libxml-dir=/usr/local/libxml2-2.7.7' '--with-openssl' '--enable-pdo' '--with-pdo-sqlite' '--with-readline=/usr/local/readline-5.2' '--with-iconv' '--with-sqlite3' '--disable-phar' '--enable-xmlwriter' '--enable-xmlreader' '--with-mysql'

## fpm for 5.5.8

    fpm -s dir -t rpm -n php-fpm -v 5.5.8 -C /tmp/installdir -p php-fpm_VERSION_ARCH.rpm -d openssl -d pcre -d bzip2 -d curl -d libjpeg -d libpng -d freetype -d gmp -d libxml2 usr

## php 5.3.2 custom build 64bit

    './configure' '--prefix=/usr/local/php-5.3.27' '--with-config-file-path=/usr/local/php-5.3.27/etc' '--with-config-file-scan-dir=/usr/local/php-5.3.27/etc/conf.d' '--disable-debug' '--enable-inline-optimization' '--disable-all' '--enable-libxml' '--enable-session' '--enable-spl' '--enable-xml' '--enable-hash' '--enable-reflection' '--with-pear' '--with-apxs2=/usr/sbin/apxs' '--with-layout=GNU' '--enable-filter' '--with-pcre-regex' '--with-zlib=/usr' '--enable-simplexml' '--enable-dom' '--with-libxml-dir=/usr/local/libxml2-2.7.7' '--with-openssl' '--enable-pdo' '--with-pdo-sqlite' '--with-readline=/usr/local/readline-5.2' '--with-iconv' '--with-sqlite3' '--disable-phar' '--enable-xmlwriter' '--enable-xmlreader' '--with-mysql=/usr/bin' '-with-libdir=lib64'
    
## php 5.3 from rpm
    yum install sqlite-devel bzip2-devel enchant-devel glib2-devel libXpm-devel gmp-devel libc-client-devel libicu gcc-c++ unixODBC-devel postgresql-devel libpspell-dev aspell-devel libedit-devel recode-devel net-snmp-devel libtidy-devel libxslt-devel 

    './configure' '--prefix=/usr/local/php-5.5.2' '--with-config-file-path=/usr/local/php-5.5.4/etc' '--build=x86_64-redhat-linux-gnu' '--with-apxs2=/usr/sbin/apxs' '--host=x86_64-redhat-linux-gnu' '--target=x86_64-redhat-linux-gnu' '--program-prefix=' '--exec-prefix=/usr/local/php-5.5.4' '--bindir=/usr/local/php-5.5.4/bin' '--sbindir=/usr/local/php-5.5.4/sbin' '--sysconfdir=/etc' '--datadir=/usr/share' '--includedir=/usr/include' '--libdir=/usr/lib64' '--libexecdir=/usr/libexec' '--localstatedir=/var' '--sharedstatedir=/var/lib' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--cache-file=../config.cache' '--with-libdir=lib64' '--with-config-file-scan-dir=/usr/local/php-5.5.4/etc/php.d' '--disable-debug' '--with-pic' '--disable-rpath' '--without-pear' '--with-bz2' '--with-exec-dir=/usr/bin' '--with-freetype-dir=/usr' '--with-png-dir=/usr' '--with-xpm-dir=/usr' '--enable-gd-native-ttf' '--without-gdbm' '--with-gettext' '--with-gmp' '--with-iconv' '--with-jpeg-dir=/usr' '--with-openssl' '--with-pcre-regex=/usr' '--with-zlib' '--with-layout=GNU' '--enable-exif' '--enable-ftp' '--enable-magic-quotes' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-sysvmsg' '--with-kerberos' '--enable-ucd-snmp-hack' '--enable-shmop' '--enable-calendar' '--without-sqlite' '--with-libxml-dir=/usr' '--enable-xml' '--with-system-tzdata' '--enable-force-cgi-redirect' '--enable-pcntl' '--with-imap=shared' '--with-imap-ssl' '--enable-mbstring=shared' '--enable-mbregex' '--with-gd=shared' '--enable-bcmath=shared' '--enable-dba=shared' '--with-db4=/usr' '--with-xmlrpc=shared' '--with-ldap=shared' '--with-ldap-sasl' '--with-mysql=/usr' '--with-mysqli=shared,/usr/lib64/mysql/mysql_config' '--enable-dom=shared' '--with-pgsql=shared' '--enable-wddx=shared' '--with-snmp=shared,/usr' '--enable-soap=shared' '--with-xsl=shared,/usr' '--enable-xmlreader=shared' '--enable-xmlwriter=shared' '--with-curl=shared,/usr' '--enable-fastcgi' '--enable-pdo=shared' '--with-pdo-odbc=shared,unixODBC,/usr' '--with-pdo-mysql=shared,/usr/lib64/mysql/mysql_config' '--with-pdo-pgsql=shared,/usr' '--with-pdo-sqlite=shared,/usr' '--with-sqlite3=shared,/usr' '--enable-json=shared' '--enable-zip=shared' '--without-readline' '--with-libedit' '--with-pspell=shared' '--enable-phar=shared' '--with-tidy=shared,/usr' '--enable-sysvmsg=shared' '--enable-sysvshm=shared' '--enable-sysvsem=shared' '--enable-posix=shared' '--with-unixODBC=shared,/usr' '--enable-fileinfo=shared' '--enable-intl=shared' '--with-icu-dir=/usr' '--with-enchant=shared,/usr'
## fpm build
    fpm -s dir -t rpm -n php-fpm -v 5.5.2 -C /tmp/installdir    -p php-fpm_VERSION_ARCH.rpm -d openssl -d pcre -d bzip2 -d curl    -d libjpeg -d libpng -d freetype -d gmp    -d libxml2 usr