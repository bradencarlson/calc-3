preamble= preamble
postOp = > /dev/null
postOp = 
LEC = -1
SEC = 0
SEC_NAME = ""
SUBSEC = 0
PRES = "true"
TOTAL = -1

DEPS = lecture-*.aux
TEMP = input-list.tmp


lecture-$(LEC).pdf: lecture-$(LEC).aux lecture-$(LEC).tex
ifeq ($(LEC), -1)
	echo "LEC is -1"
else 
ifeq ($(PRES), "true")
	pdflatex -jobname=lecture-$(LEC) "\PassOptionsToClass{15pt}{article}\
		\input{$(preamble)}\
		\begin{document}\
		\setcounter{section}{$(SEC)}\
		\section{$(SEC_NAME)}\
		\setcounter{subsection}{$(SUBSEC)}\
		\input{lecture-$(LEC)}\
		\end{document}" $(postOp)
else 
	pdflatex -jobname=lecture-$(LEC) "\PassOptionsToClass{nopresentation}{notes}\
		\input{$(preamble)}\
		\begin{document}\
		\setcounter{section}{$(SEC)}\
		\section{$(SEC_NAME)}\
		\setcounter{subsection}{$(SUBSEC)}\
		\input{lecture-$(LEC)}\
		\end{document}" $(postOp)
endif
endif

lecture-$(LEC).aux:
ifeq ($(LEC), -1)
	echo "LEC is -1"
else
ifeq ($(PRES), "true")
	pdflatex -jobname=lecture-$(LEC) "\PassOptionsToClass{15pt}{article}\
		\input{$(preamble)}\
		\begin{document}\
		\setcounter{section}{$(SEC)}\
		\section{$(SEC_NAME)}\
		\setcounter{subsection}{$(SUBSEC)}\
		\input{lecture-$(LEC)}\
		\end{document}" $(postOp)
else 
	pdflatex -jobname=lecture-$(LEC) "\PassOptionsToClass{nopresentation}{notes}\
		\input{$(preamble)}\
		\begin{document}\
		\setcounter{section}{$(SEC)}\
		\section{$(SEC_NAME)}\
		\setcounter{subsection}{$(SUBSEC)}\
		\input{lecture-$(LEC)}\
		\end{document}" $(postOp)
endif
endif

full: *.tex lecture-full.aux lecture-full.toc
ifeq ($(TOTAL), -1)
	@echo "Total is -1"
else 
	for i in $$(seq 1 $(TOTAL)); do \
		if [[ $${i} == 1 ]]; then \
			echo "\section{Linear Equations and Systems}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 10 ]]; then \
			echo "\section{Matrix Algebra}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 13 ]]; then \
			echo "\section{Determinants}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 16 ]]; then \
			echo "\section{Vector Spaces}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 23 ]]; then \
			echo "\section{Eigenvalues and Eigenvectors}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 26 ]]; then \
			echo "\section{Inner Product Spaces}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 33 ]]; then \
			echo "\section{Game Theory}" >> $(TEMP);\
		fi;\
		echo "\input{lecture-$${i}.tex}" >> $(TEMP);\
	done
	pdflatex --jobname=lecture-full "\PassOptionsToClass{nopresentation}{notes}\
		\input{$(preamble)}\
		\begin{document}\
		\renewcommand*{\theHtheorem}{mythm.\thesubsection.\thetheorem}\
		\tableofcontents\
		\input{$(TEMP)}\
		\end{document}" $(postOp)
	rm $(TEMP)
endif

lecture-full.toc: 
ifeq ($(TOTAL), -1)
	@echo "Total is -1"
else 
	for i in $$(seq 1 $(TOTAL)); do \
		if [[ $${i} == 1 ]]; then \
			echo "\section{Linear Equations and Systems}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 10 ]]; then \
			echo "\section{Matrix Algebra}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 13 ]]; then \
			echo "\section{Determinants}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 16 ]]; then \
			echo "\section{Vector Spaces}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 23 ]]; then \
			echo "\section{Eigenvalues and Eigenvectors}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 26 ]]; then \
			echo "\section{Inner Product Spaces}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 33 ]]; then \
			echo "\section{Game Theory}" >> $(TEMP);\
		fi;\
		echo "\input{lecture-$${i}.tex}" >> $(TEMP);\
	done
	pdflatex --jobname=lecture-full "\PassOptionsToClass{nopresentation}{notes}\
		\input{$(preamble)}\
		\renewcommand*{\theHtheorem}{mythm.\thesubsection.\thetheorem}\
		\begin{document}\
		\tableofcontents\
		\input{$(TEMP)}\
		\end{document}" $(postOp)
	rm $(TEMP)
endif
		
lecture-full.aux: 
ifeq ($(TOTAL), -1)
	@echo "Total is -1"
else 
	for i in $$(seq 1 $(TOTAL)); do \
		if [[ $${i} == 1 ]]; then \
			echo "\section{Linear Equations and Systems}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 10 ]]; then \
			echo "\section{Matrix Algebra}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 13 ]]; then \
			echo "\section{Determinants}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 16 ]]; then \
			echo "\section{Vector Spaces}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 23 ]]; then \
			echo "\section{Eigenvalues and Eigenvectors}" >> $(TEMP);\
		fi;\
		if [[ $${i} == 33 ]]; then \
			echo "\section{Game Theory}" >> $(TEMP);\
		fi;\
		echo "\input{lecture-$${i}.tex}" >> $(TEMP);\
	done
	pdflatex --jobname=lecture-full "\PassOptionsToClass{nopresentation}{notes}\
		\input{$(preamble)}\
		\renewcommand*{\theHtheorem}{mythm.\thesubsection.\thetheorem}\
		\begin{document}\
		\tableofcontents\
		\input{$(TEMP)}\
		\end{document}" $(postOp)
	rm $(TEMP)
endif

clean: 
	rm -f *.aux *.toc *.log *.out

sparkling: 
	rm -f *.aux *.toc *.log *.out *.pdf

