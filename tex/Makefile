.PHONY: all light clean

all: build clean

build:
	R CMD BATCH fosastoc.R
	rm fosastoc.Rout
	pdflatex fosastoc.tex
	makeglossaries fosastoc
	pdflatex fosastoc.tex
	bibtex fosastoc.aux
	pdflatex fosastoc.tex
	pdflatex fosastoc.tex
	pdflatex fosastoc.tex

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.blg
	rm -f *.glo
	rm -f *.lof
	rm -f *.log
	rm -f *.lot
	rm -f *.out
	rm -f *.Rout
	rm -f *.toc
	rm -f *.run.xml
	rm -f *.xdy
