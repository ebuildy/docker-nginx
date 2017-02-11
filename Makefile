gen:
	ruby ci/build.rb

build: gen
	docker build -t ebuildy_local/nginx dist/nginx
	docker build -t ebuildy_local/nginx:ssl dist/nginx+letsencrypt

letsencrypt/dev: gen
	docker build -t ebuildy_local/nginx:ssl dist/nginx+letsencrypt

	docker run -ti --rm -p 80:80 -p 443:443 --name letsencrypt ebuildy_local/nginx:ssl
