---
title: python
layout: howtos
---

## Local development

### pyenv on MacOS Mojave

* Install brew
* Run the following:

```
CFLAGS="-I$(brew --prefix readline)/include -I$(brew --prefix openssl)/include -I$(xcrun --show-sdk-path)/usr/include" \
LDFLAGS="-L$(brew --prefix readline)/lib -L$(brew --prefix openssl)/lib" \
PYTHON_CONFIGURE_OPTS=--enable-unicode=ucs2 \
pyenv install -v 3.6.0
```

#### common errors

Missing the OpenSSL lib?

mac:

```
brew install openssl
```

### pipenv

```
pip install --user pipenv
```

cd to your project

```
pipenv install -r requirements.txt
```

start a virtualenv shell

```
pipenv shell
```
