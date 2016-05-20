OUTDIR = build

FLAGS_PDFLATEX =	-use-make	-bibtex	-pdf    	-outdir=$(OUTDIR)
FLAGS_XELATEX =  	-use-make	-bibtex	-xelatex	-outdir=$(OUTDIR)
FLAGS_LUALATEX = 	-use-make 	-bibtex -lualatex	-outdir=$(OUTDIR)

###############################################################################

all: paper poster poster-nccr presentation-simple presentation-hri

output: output-paper output-poster output-poster-nccr output-presentation-simple output-presentation-hri

clean-output:
	rm -rf output/

clean: clean-paper clean-poster clean-poster-nccr clean-presentation-simple clean-presentation-hri

###############################################################################
# IEEEtran paper
###############################################################################

paper: paper/$(OUTDIR)/paper.pdf

paper/$(OUTDIR)/paper.pdf: paper/paper.tex
	mkdir -p paper/$(OUTDIR)
	cd paper && latexmk $(FLAGS_PDFLATEX) paper.tex

output-paper: output/paper/paper.pdf

output/paper/paper.pdf: paper
	mkdir -p output/paper/
	cp paper/$(OUTDIR)/paper.pdf output/paper/

clean-paper:
	rm -f paper/$(OUTDIR)/*

###############################################################################
# Simple baposter
###############################################################################

poster: poster/$(OUTDIR)/poster.pdf

poster/$(OUTDIR)/poster.pdf: poster/poster.tex
	mkdir -p poster/$(OUTDIR)
	cd poster && latexmk $(FLAGS_PDFLATEX) poster.tex

output-poster: output/poster/poster.pdf

output/poster/poster.pdf: poster
	mkdir -p output/poster/
	cp poster/$(OUTDIR)/poster.pdf output/poster/

clean-poster:
	rm -f poster/$(OUTDIR)/*

###############################################################################
# NCCR poster
###############################################################################

poster-nccr: poster-nccr/$(OUTDIR)/poster.pdf

poster-nccr/$(OUTDIR)/poster.pdf: poster-nccr/poster.svg
	mkdir -p poster-nccr/$(OUTDIR)
	cd poster-nccr && inkscape poster.svg --export-pdf=$(OUTDIR)/poster.pdf

output-poster-nccr: output/poster-nccr/poster.pdf

output/poster-nccr/poster.pdf: poster-nccr
	mkdir -p output/poster-nccr/
	cp poster-nccr/$(OUTDIR)/poster.pdf output/poster-nccr/

clean-poster-nccr:
	rm -f poster-nccr/$(OUTDIR)/*

###############################################################################
# Simple beamer presentation
###############################################################################

presentation-simple: presentation-simple/$(OUTDIR)/presentation.pdf

presentation-simple/$(OUTDIR)/presentation.pdf: presentation-simple/presentation.tex
	mkdir -p presentation-simple/$(OUTDIR)
	cd presentation-simple && latexmk $(FLAGS_LUALATEX) presentation.tex && cd $(OUTDIR) && ln -fs ../videos/ .

output-presentation-simple: output/presentation-simple/presentation.pdf

output/presentation-simple/presentation.pdf: presentation-simple
	mkdir -p output/presentation-simple/
	mkdir -p output/presentation-simple/videos/
	cp presentation-simple/$(OUTDIR)/presentation.pdf output/presentation-simple/
	cp presentation-simple/videos/* output/presentation-simple/videos/

clean-presentation-simple:
	rm -f presentation-simple/$(OUTDIR)/*

###############################################################################
# HRI-themed beamer presentation
###############################################################################

presentation-hri: presentation-hri/$(OUTDIR)/presentation.pdf

presentation-hri/$(OUTDIR)/presentation.pdf: presentation-hri/presentation.tex
	mkdir -p presentation-hri/$(OUTDIR)
	cd presentation-hri && latexmk $(FLAGS_LUALATEX) presentation.tex && cd $(OUTDIR) && ln -fs ../videos/ .

output-presentation-hri: output/presentation-hri/presentation.pdf

output/presentation-hri/presentation.pdf: presentation-hri
	mkdir -p output/presentation-hri/
	mkdir -p output/presentation-hri/videos/
	cp presentation-hri/$(OUTDIR)/presentation.pdf output/presentation-hri/
	cp presentation-hri/videos/* output/presentation-hri/videos/

clean-presentation-hri:
	rm -f presentation-hri/$(OUTDIR)/*
