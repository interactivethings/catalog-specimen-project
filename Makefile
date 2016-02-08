.PHONY: lib clean

all: ProjectSpecimen.js

clean:
	@rm -rf lib ProjectSpecimen.js

lib: clean
	@$$(npm bin)/babel src --ignore __tests__ --out-dir $@

ProjectSpecimen.js: clean
	@NODE_ENV=production $$(npm bin)/rollup ./src/Project.js --config=./rollup.config.js --output=./$@