DOKUMENT = thesis

all: 
	make clean
	make $(DOKUMENT).pdf

$(DOKUMENT).pdf: $(DOKUMENT).tex
	latexmk -cd -f -pdf $(DOKUMENT).tex -use-make
	make show

# (re)make nomenclature
$(DOKUMENT).nls: $(DOKUMENT).nlo
	makeindex $(DOKUMENT).nlo -s nomencl.ist -o $(DOKUMENT).nls

show: $(DOKUMENT).pdf
	xdg-open $< &

clean: 
	latexmk -CA
