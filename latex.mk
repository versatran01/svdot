FILE=main

all: $(FILE).tex
	rubber -d $<

edit:
	texmaker $(FILE).tex &

test:
	evince $(FILE).pdf &

clean:
	rm -f *.aux *.log *.out *.pdf *.pdfsync *.synctex.gz *.blg *.bbl *.tex.bak
