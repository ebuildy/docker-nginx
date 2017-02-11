FROM debian:8

RUN apt-get update && \
	apt-get install -y \
		curl

# Setup repos
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add - && \
		echo "deb http://nginx.org/packages/debian/ jessie nginx" 		>  /etc/apt/sources.list.d/nginx.list && \
		echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list

# Add s6 overlay
RUN curl -sL "https://github.com/just-containers/s6-overlay/releases/download/v1.19.1.1/s6-overlay-amd64.tar.gz" | \
		tar xz --strip-component 1 -C /

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends \
        nginx=1.10.*

ADD nginx /etc/services.d/nginx

ENTRYPOINT ["/init"]

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 80

HEALTHCHECK CMD curl --fail http://localhost/ || exit 1
