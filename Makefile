share := /usr/local/share/bytecodeviewer
bin := $(share)/bcv.jar
local := /usr/local/bin
script := $(local)/bcv

hello:

install:
	mkdir -p $(share)
	curl -Ls -o $(bin) $$(curl -s https://api.github.com/repos/Konloch/bytecode-viewer/releases/latest | grep -P '.*browser_.*.jar' | cut -d\" -f4)
	echo -e "#!/usr/bin/sh\njava -Dawt.useSystemAAFontSettings=on -jar $(bin)" > $(script)
	chmod +x $(script)

clean:
	rm $(script)
	rm $(bin)
