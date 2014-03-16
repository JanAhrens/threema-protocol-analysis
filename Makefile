# remove *.pdf, *.aux, *.idx files when an error occurs
# https://stackoverflow.com/questions/12343428/latex-reference-and-makefile/14600960#14600960
.DELETE_ON_ERROR:

.PHONY: clean

ifeq ($(shell test -f .git/hooks/post-commit; echo $$?), 1)
  $(error You need to setup a git-hook first. Please read the README.markdown)
endif

all: threema-protocol-analysis.pdf

threema-protocol-analysis.pdf: gitHeadInfo.gin

gitHeadInfo.gin:
	@if [ ! -f gitHeadInfo.gin ]; then echo 'Running git hook manually'; .git/hooks/post-commit; fi

clean:
	rm -f *.pdf
	rm -f *.log
	rm -f *.toc
	rm -f *.out
	rm -f *.aux
	rm -f *.eps
	rm -f *.gin

%.pdf %.aux %.idx: %.tex
	@pdflatex $<
	@while grep 'Rerun to get ' $*.log; do pdflatex $< ; done
	@if grep -q 'LaTeX Warning' $*.log; then echo "------ There were warnings -----"; grep 'LaTeX Warning' $*.log ; fi
