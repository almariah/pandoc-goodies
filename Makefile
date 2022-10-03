build:
	npm run sass 
	npm run cleancss 
	npm run css-injector 

preview:
	pandoc  -f markdown \
            -t html5 \
            --standalone \
            --template=github-blog.html \
            --highlight-style=haddock \
            --lua-filter=obsidian-filter.lua \
            --toc \
            -o preview.html \
			src/preview.md
