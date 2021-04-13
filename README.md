# Basic setup tool for VDS with Docker or DigitalOcean Docker Droplets

## Description
Setup tool allows to install the following components:
- <b>Traefik</b> - for easy reverse proxying into container network.
- <b>Portainer</b> - for easy browser-management of your docker containers, images, etc.
- <b>Docker Registry</b> (optional) - already configured Docker Registry.

All SSL Certificates will be provided by Lets Encrypt, so USER_ENROLLMENT_EMAIL <b>must</b> be specified.

## Preparation
For successfull initializing you must create <b>.env</b> file in <b>/install</b> directory. See <b>env.template</b> file for template model.

Parameters:
- <b>ADMIN_CREDENTIALS</b>         - credentials for admin account of Traefik and Docker Registry.
- <b>USER_CREDENTIALS</b>          - credentials for user account for Traefik.
- <b>ADMIN_PORTAINER_PASSWORD</b>  - password for Portainer.
- <b>PORTAINER_FQDN</b>            - fully-qualified domain name of Portainer instance.
- <b>REGISTRY_FQDN</b> (optional)  - fully-qualified domain name of Docker Registry instance.
- <b>TRAEFIK_FQDN</b>              - fully-qualified domain name of Traefik instance.
- <b>USER_ENROLLMENT_EMAIL</b>     - email for LetsEncrypt Certificate enrollment.

To generate credentials, run:
```sh
  sudo apt install -y apache2-utils

  echo $(htpasswd -nbB <USER> "<PASSWORD>")
```

## Installation
```sh
  git clone https://github.com/yoyrandao/droplet_setup.git

  cd droplet_setup
  chmod +x setup.sh
```
```sh
  bash setup.sh
```

There is no Docker Registry installation provided by default. If needed installation command will be:

```sh
  bash setup.sh -withRegistry
```

