OUTDIR = build
FIGDIR = figures

FLAGS_PDFLATEX =	-use-make	-bibtex	-pdf    	-outdir=$(OUTDIR)
FLAGS_XELATEX =  	-use-make	-bibtex	-xelatex	-outdir=$(OUTDIR)

###############################################################################

all: paper poster presentation-simple presentation-hri

clean: clean-paper clean-poster clean-presentation-simple clean-presentation-hri

###############################################################################

paper: paper/$(OUTDIR)/paper.pdf

paper/$(OUTDIR)/paper.pdf: paper/paper.tex
	mkdir -p paper/$(OUTDIR)
	cd paper && latexmk $(FLAGS_PDFLATEX) paper.tex

clean-paper:
	rm -f paper/$(OUTDIR)/*

###############################################################################

poster: poster/$(OUTDIR)/poster.pdf

poster/$(OUTDIR)/poster.pdf: poster/poster.tex
	mkdir -p poster/$(OUTDIR)
	cd poster && latexmk $(FLAGS_PDFLATEX) poster.tex

clean-poster:
	rm -f poster/$(OUTDIR)/*

###############################################################################

presentation-simple: presentation-simple/$(OUTDIR)/presentation.pdf

presentation-simple/$(OUTDIR)/presentation.pdf: presentation-simple/presentation.tex
	mkdir -p presentation-simple/$(OUTDIR)
	cd presentation-simple && latexmk $(FLAGS_XELATEX) presentation.tex

clean-presentation-simple:
	rm -f presentation-simple/$(OUTDIR)/*

###############################################################################

presentation-hri: presentation-hri/$(OUTDIR)/presentation.pdf

presentation-hri/$(OUTDIR)/presentation.pdf: presentation-hri/presentation.tex
	mkdir -p presentation-hri/$(OUTDIR)
	cd presentation-hri && latexmk $(FLAGS_XELATEX) presentation.tex

clean-presentation-hri:
	rm -f presentation-hri/$(OUTDIR)/*

###############################################################################
