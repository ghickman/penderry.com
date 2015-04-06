PELICAN=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

help:
	@echo 'Makefile for penderry.com'
	@echo ''
	@echo 'Usage:'
	@echo '   make clean                       remove the generated files'
	@echo '   make build                       (re)generate the web site'
	@echo '   make deploy                      upload the web site via s3cmd'
	@echo '   make setup                       upload the web site via s3cmd'
	@echo '   make watch                       start/restart develop_server.sh'
	@echo ''

clean:
	find $(OUTPUTDIR) -mindepth 1 -delete

build: clean
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE)
	@cat \
		theme/static/styles/normalize.css \
		bower_components/fancybox/source/jquery.fancybox.css \
		bower_components/fancybox/source/helpers/jquery.fancybox-buttons.css \
		bower_components/fancybox/source/helpers/jquery.fancybox-thumbs.css \
		theme/static/styles/main.css \
		> output/main.css && \
		sed -i '' -e 's/fancybox_/\/img\/fancybox_/' -e 's/blank.gif/\/img\/blank.gif/' output/main.css && \
		echo 'Built CSS'
	@mkdir -p output/img && \
		cp theme/static/images/favicon.ico output/img/ && \
		cp theme/static/images/*.jpg output/img/ && \
		cp theme/static/images/*.png output/img/ && \
		cp bower_components/fancybox/source/*.gif output/img/ && \
		cp bower_components/fancybox/source/*.png output/img/ && \
		echo 'Built Images'
	@cat \
		bower_components/fancybox/source/jquery.fancybox.js \
		bower_components/fancybox/source/helpers/jquery.fancybox-buttons.js \
		bower_components/fancybox/source/helpers/jquery.fancybox-media.js \
		bower_components/fancybox/source/helpers/jquery.fancybox-thumbs.js \
		> output/main.js && echo 'Built JS'

deploy: clean build
	s3cmd sync $(OUTPUTDIR)/* S3://penderry.com --cf-invalidate --delete-removed
	@echo 'Published $(S3_BUCKET)'

run:
	@foreman start -f Procfile.dev

setup:
	direnv allow
	pip install -r requirements.txt
	npm install
	bower install

watch:
	watchmedo shell-command -RDWc 'make build' content/ theme/ bower_components/

.PHONY: help clean build deploy run serve watch
