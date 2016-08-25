OUTDIR = build

FLAGS_PDFLATEX =	-use-make	-bibtex	-pdf    	-outdir=$(OUTDIR)
FLAGS_XELATEX =  	-use-make	-bibtex	-xelatex	-outdir=$(OUTDIR)
FLAGS_LUALATEX = 	-use-make 	-bibtex -lualatex	-outdir=$(OUTDIR)

###############################################################################

all: paper-ieeetran paper-sigchi poster poster-nccr presentation-simple presentation-hri

output: output-paper-ieeetran output-paper-sigchi output-poster output-poster-nccr output-presentation-simple output-presentation-hri

clean-output:
	rm -rf output/

clean: clean-paper-ieeetran clean-paper-sigchi clean-poster clean-poster-nccr clean-presentation-simple clean-presentation-hri

###############################################################################
# IEEEtran paper
###############################################################################

paper-ieeetran: paper-ieeetran/$(OUTDIR)/paper-ieeetran.pdf

paper-ieeetran/$(OUTDIR)/paper-ieeetran.pdf: paper-ieeetran/paper-ieeetran.tex
	mkdir -p paper-ieeetran/$(OUTDIR)
	cd paper-ieeetran && latexmk $(FLAGS_PDFLATEX) paper-ieeetran.tex

output-paper-ieeetran: output/paper-ieeetran/paper-ieeetran.pdf

output/paper-ieeetran/paper-ieeetran.pdf: paper-ieeetran
	mkdir -p output/paper-ieeetran/
	cp paper-ieeetran/$(OUTDIR)/paper-ieeetran.pdf output/paper-ieeetran/

clean-paper-ieeetran:
	rm -f paper-ieeetran/$(OUTDIR)/*

###############################################################################
# SIGCHI paper
###############################################################################

paper-sigchi: paper-sigchi/$(OUTDIR)/paper-sigchi.pdf

paper-sigchi/$(OUTDIR)/paper-sigchi.pdf: paper-sigchi/paper-sigchi.tex
	mkdir -p paper-sigchi/$(OUTDIR)
	cd paper-sigchi && latexmk $(FLAGS_PDFLATEX) paper-sigchi.tex

output-paper-sigchi: output/paper-sigchi/paper-sigchi.pdf

output/paper-sigchi/paper-sigchi.pdf: paper-sigchi
	mkdir -p output/paper-sigchi/
	cp paper-sigchi/$(OUTDIR)/paper-sigchi.pdf output/paper-sigchi/

clean-paper-sigchi:
	rm -f paper-sigchi/$(OUTDIR)/*

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
