Yet another Docker image with Nginx and LetsEncrypt, from Debian Jessie (8), with healcheck port 80 and 443.

## nginx

Nginx 1.10 - Solo - port 80


### Docker tags

- latest
- 1.1

### Environment variables

- **WWW_ROOT** Set default server root (default: /var/www)
- **NGINX_CONF_FILE** File path to nginx conf file (default: nginx.conf)

### Volumes


```
docker run -p 80:80 -v $(pwd):/var/www ebuildy/nginx:1.10

```

## nginx+letsencrypt

Nginx 1.10 with LetsEncrypt companion to automatically generate SSL certificates.
You must create a certbot config.ini file (to set domains, emails etc..), certificates will be generated at container start.


### Docker tags

- ssl
- 1.10+ssl

### Environment variables

- **WWW_ROOT** Set default server root (default: /var/www)
- **NGINX_CONF_FILE** File path to nginx conf file (default: nginx.conf)
- **LETSENCRYPT_RUN** Control if we must run certbot certs creation or not (default: true)
- **CERTBOT_CONFIG_FILE** Path to certbot config file (where you set your domains, email ...) (default: /etc/letsencrypt/cli.ini)

### Volumes

- **/etc/nginx/ssl** Store Diffie-Hellman group pem file.

- **/etc/letsencrypt** Store LetsEncrypt certificates and all stuff generated.


```
docker run -p 80:80 -p 443:443 -v $(pwd):/var/www ebuildy/nginx:1.10+ssl

```

