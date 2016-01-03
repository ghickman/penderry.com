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
	@cat \
		css/reset.css \
		css/normalize.css \
		bower_components/flickity/dist/flickity.min.css \
		css/main.css \
		| cssmin \
		> output/main.css && \
		echo 'Built CSS'
	@mkdir -p output/img && \
		cp img/favicon.ico output/ && \
		cp img/*.jpg output/img/ && \
		echo 'Built Images'
	@cat \
		bower_components/jquery/dist/jquery.js \
		bower_components/flickity/dist/flickity.pkgd.min.js \
		js/main.js \
		| uglifyjs --screw-ie8 \
		> output/main.js && echo 'Built JS'
	@cp -R static/fonts output/ && \
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
	bower install

watch:
	watchmedo shell-command -RDWc 'make build' bin/ css/ img/ js/ static/ templates/ bower_components/

.PHONY: help clean build deploy run serve watch
