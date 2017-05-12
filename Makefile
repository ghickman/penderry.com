OUTPUTDIR=$(CURDIR)/output

help:
	@echo 'Makefile for penderry.com'
	@echo ''
	@echo 'Usage:'
	@echo '   make clean                       clean the build directory'
	@echo '   make build                       build the site'
	@echo '   make deploy                      deploy to s3 and invalidate CF distro'
	@echo '   make run                         run all jobs'
	@echo '   make setup                       set up dev environment'
	@echo '   make watch                       rebuild the site when changes are detected'
	@echo ''

clean:
	@find $(OUTPUTDIR) -mindepth 1 -delete && echo 'Cleaned Output'

build: clean
	@bin/build && echo 'Built Templates'
	@node_modules/.bin/lessc css/main.less > css/main.css
	@cat \
		node_modules/flickity/dist/flickity.min.css \
		css/main.css \
		| node_modules/.bin/cssmin \
		> output/main.css && \
		rm css/main.css && \
		echo 'Built CSS'
	@mkdir -p output/img && \
		cp img/favicon.ico output/ && \
		cp img/*.jpg output/img/ && \
		cp img/*.png output/img/ && \
		cp img/*.svg output/img/ && \
		echo 'Built Images'
	@cat \
		node_modules/jquery/dist/jquery.js \
		node_modules/flickity/dist/flickity.pkgd.min.js \
		js/main.js \
		| node_modules/.bin/uglifyjs --screw-ie8 \
		> output/main.js && echo 'Built JS'
	@cp -R fonts output/ && \
		echo 'Built Fonts'

deploy: clean build
	s3cmd sync $(OUTPUTDIR)/* S3://penderry.com --cf-invalidate --delete-removed
	@echo 'Published penderry.com'

run:
	@heroku local -f Procfile.dev

setup:
	direnv allow
	pip install -r requirements.txt
	npm install

watch:
	watchmedo shell-command -RDWc 'make build' bin/ css/ fonts/ img/ js/ templates/ node_modules/

.PHONY: help clean build deploy run serve watch
