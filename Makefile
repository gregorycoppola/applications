all:
	pdflatex index
	bibtex index
	pdflatex index
	pdflatex index

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.pdf