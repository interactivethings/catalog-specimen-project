.PHONY: lib clean install

all: ProjectSpecimen.js

node_modules: package.json
	npm install

install: node_modules

clean:
	@rm -rf lib ProjectSpecimen.js

ProjectSpecimen.js: install clean
	@NODE_ENV=production $$(npm bin)/rollup ./src/Project.js --config=./rollup.config.js --output=./$@
