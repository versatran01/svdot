NAME=main

all: $(NAME).tex
	rubber -d $<

% : %.tex
	rubber -d $<

edit:
	vim $(NAME).tex

test:
	evince $(NAME).pdf &

clean:
	rm -f *.aux *.log *.out *.pdf *.pdfsync *.synctex.gz *.blg *.bbl *.tex.bak
