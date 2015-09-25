build: index.html bundle.js index.css

index.html: index.jade
	./node_modules/.bin/jade < $^ > $@

bundle.js: index.js
	./node_modules/.bin/browserify $^ -o $@

index.css: index.styl
	./node_modules/.bin/stylus < $^ | ./node_modules/.bin/postcss -u autoprefixer > $@

watchify: index.js
	./node_modules/.bin/watchify $^ -o bundle.js

serve:
	make watchify & ./node_modules/.bin/serve .

clean:
	rm index.html bundle.js index.css

.PHONY: clean serve watchify
