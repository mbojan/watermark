
default: watermark.pdf


%.pdf: %.tex
	latexmk -pdf $<
