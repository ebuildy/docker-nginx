Yet another Docker image with Nginx and LetEncrypt, from Debian Jessie (8), with healcheck port 80 and 443.

## nginx

Nginx 1.10 - Solo - port 80


### Docker tags

- latest
- 1.1

### Environment variables

- **WWW_ROOT** Set default server root (default: /var/www)
- **NGINX_CONF_FILE** File path to nginx conf file (default: nginx.conf)

```
docker run -p 80:80 -v $(pwd):/var/www ebuildy/nginx:1.10

```

## nginx+letencrypt

Nginx 1.10 with LetEncrypt companion to automatically generate SSL certificates.


### Docker tags

- letencrypt
- 1.10+letencrypt

### Environment variables

- **WWW_ROOT** Set default server root (default: /var/www)
- **NGINX_CONF_FILE** File path to nginx conf file (default: nginx.conf)

```
docker run -p 80:80 -p 443:443 -v $(pwd):/var/www ebuildy/nginx:1.10+letencrypt

```

