build:
	npm run sass 
	npm run cleancss 
	npm run css-injector 

preview:
	pandoc  -f markdown \
            -t html5 \
            --standalone \
            --template=GitHub.html5 \
            --highlight-style=haddock \
            --toc \
            -o GitHub-Template-Preview.html \
			src/PREVIEW.md
