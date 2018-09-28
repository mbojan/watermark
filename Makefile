files=$(wildcard *.tex)

default: $(files:.tex=.pdf)

%.pdf: %.tex
	latexmk -pdf $<

img/%.png: %.pdf
	convert $< -density 50 $@


thumbs: $(addprefix img/,$(files:.tex=.png))


.PHONY: default thumbs
