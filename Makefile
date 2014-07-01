#########################################3#####################################
#Common Makefile for all modules 
###############################################################################

all: paper/paper.pdf poster/poster.pdf presentation/presentation.pdf

paper/paper.pdf: paper/paper.tex
	cd paper && latexmk -pdf -pdflatex="pdflatex -interaction batchmode" -use-make paper.tex
	cd ../

poster/poster.pdf: poster/poster.tex
	cd poster && latexmk -pdf -pdflatex="pdflatex -interaction batchmode" -use-make poster.tex
	cd ../
	
presentation/presentation.pdf: presentation/presentation.tex
	cd presentation && latexmk -pdf -pdflatex="pdflatex -interaction batchmode" -use-make presentation.tex
	cd ../
	
paper-clean: 
	rm -f paper/*.aux paper/*.bbl paper/*.blg paper/*.fdb_latexmk paper/*.fls paper/*.log paper/*.out paper/*.pdf paper/*.backup
	
poster-clean: 
	rm -f poster/*.aux poster/*.bbl poster/*.blg poster/*.fdb_latexmk poster/*.fls poster/*.log poster/*.out poster/*.pdf poster/*.backup
	
presentation-clean: 
	rm -f presentation/*.aux presentation/*.bbl presentation/*.blg presentation/*.fdb_latexmk presentation/*.fls presentation/*.log presentation/*.out presentation/*.pdf presentation/*.backup presentation/*.snm presentation/*.nav presentation/*.toc
	
clean: paper-clean poster-clean presentation-clean

distclean: clean
