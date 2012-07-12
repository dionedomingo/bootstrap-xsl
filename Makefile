xmls := $(wildcard xml/*.xml)
htmls := $(subst xml,html,$(xmls))

all: clean html $(htmls) 

html:
	mkdir -p html
	mkdir -p html/css
	mkdir -p html/js
	mkdir -p html/i
	cp -u css/* html/css
	cp -u js/* html/js
	cp -ur i/* html/i

html/%.html: xml/%.xml 
	xsltproc -o $@ xsl/index.xsl $< 

.PHONY : html clean

clean: 
	rm -rf html/*html