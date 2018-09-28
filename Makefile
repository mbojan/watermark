SHELL=/bin/bash

tex_files=$(wildcard *.tex)
pdf_files=$(tex_files:.tex=.pdf)
thumbfiles=$(addprefix img/,$(tex_files:.tex=.png))

default:

define runmo =
export ARRAY=($(tex_files:.tex=))
. ~/bin/mo
mo $< > $@
endef



%.pdf: %.tex
	latexmk -pdf $<

img/%.png: %.pdf
	mkdir -p img
	convert -density 20 -quality 85 -bordercolor Black -compose Copy -border 1 $< $@

README.md: README-in.md $(thumbfiles)
	$(runmo)

README.html: README.md
	pandoc $< -o $@ -f gfm


pdf: $(pdf_files)

thumbs: $(thumbfiles)

default: $(pdf_files) README.md


.ONESHELL:

.PHONY: default thumbs

