xmls := $(wildcard xml/*.xml)
htmls := $(subst xml,html,$(xmls))

all: clean html $(htmls) 

html:
	mkdir html

html/%.html: xml/%.xml 
	xsltproc -o $@ xsl/index.xsl $< 

.PHONY : clean

clean: 
	rm -rf html/*html