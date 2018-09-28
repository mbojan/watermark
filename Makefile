files=$(wildcard *.tex)

default: $(files:.tex=.pdf)

%.pdf: %.tex
	latexmk -pdf $<
