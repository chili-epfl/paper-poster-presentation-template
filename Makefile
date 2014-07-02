#########################################3#####################################
#Common Makefile for all modules 
###############################################################################

all: paper poster presentation-simple presentation-hri

paper: paper/paper.pdf

poster: poster/poster.pdf

presentation-simple: presentation-simple/presentation.pdf

presentation-hri: presentation-hri/presentation.pdf

paper/paper.pdf: paper/paper.tex
	cd paper && latexmk -pdf -pdflatex="pdflatex -interaction batchmode -shell-escape" -use-make paper.tex
	cd ../

poster/poster.pdf: poster/poster.tex
	cd poster && latexmk -pdf -pdflatex="pdflatex -interaction batchmode -shell-escape" -use-make poster.tex
	cd ../
	
presentation-simple/presentation.pdf: presentation-simple/presentation.tex
	cd presentation-simple && latexmk -pdf -xelatex -quiet -use-make presentation.tex
	cd ../

presentation-hri/presentation.pdf: presentation-hri/presentation.tex
	cd presentation-hri && latexmk -pdf -xelatex -quiet -use-make presentation.tex
	cd ../
	
paper-clean: 
	rm -f paper/paper.aux paper/paper.bbl paper/paper.blg paper/paper.fdb_latexmk paper/paper.fls paper/paper.log paper/paper.out paper/paper.pdf paper/*.backup
	
poster-clean: 
	rm -f poster/poster.aux poster/poster.bbl poster/poster.blg poster/poster.fdb_latexmk poster/poster.fls poster/poster.log poster/poster.out poster/poster.pdf poster/*.backup
	
presentation-simple-clean: 
	rm -f presentation-simple/presentation.aux presentation-simple/presentation.bbl presentation-simple/presentation.blg presentation-simple/presentation.fdb_latexmk presentation-simple/presentation.fls presentation-simple/presentation.log presentation-simple/presentation.out presentation-simple/presentation.pdf presentation-simple/*.backup presentation-simple/presentation.snm presentation-simple/presentation.nav presentation-simple/presentation.toc
	
presentation-hri-clean: 
	rm -f presentation-hri/presentation.aux presentation-hri/presentation.bbl presentation-hri/presentation.blg presentation-hri/presentation.fdb_latexmk presentation-hri/presentation.fls presentation-hri/presentation.log presentation-hri/presentation.out presentation-hri/presentation.pdf presentation-hri/*.backup presentation-hri/presentation.snm presentation-hri/presentation.nav presentation-hri/presentation.toc
	
clean: paper-clean poster-clean presentation-simple-clean presentation-hri-clean

distclean: clean
