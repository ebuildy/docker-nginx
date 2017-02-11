gen:
	ruby ci/build.rb

build: gen
	docker build -t ebuildy_local/nginx dist/nginx
	docker build -t ebuildy_local/nginx:letencrypt dist/nginx+letencrypt

letencrypt/dev: gen
	docker build -t ebuildy_local/nginx:letencrypt dist/nginx+letencrypt

	docker run -ti --rm -p 80:80 -p 443:443 --name letencrypt ebuildy_local/nginx:letencrypt
