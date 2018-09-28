SHELL=/bin/bash

tex_files=$(wildcard *.tex)
pdf_files=$(tex_files:.tex=.pdf)
thumbfiles=$(addprefix img/,$(files:.tex=.png))

default:

define runmo =
export ARRAY=($(tex_files:.tex=))
. ~/bin/mo
mo $< > $@
endef



%.pdf: %.tex
	latexmk -pdf $<

img/%.png: %.pdf
	convert $< -density 50 $@

README.md: README-in.md $(thumbfiles)
	$(runmo)



pdf: $(pdf_files)

thumbs: $(thumbfiles)

default: $(pdf_files) README.md


.ONESHELL:

.PHONY: default thumbs

