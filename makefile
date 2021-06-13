MYDIR = ./doc/asciinema
documentacao: $(MYDIR)/*.cast
	for file in $^ ; do \
		texto=$${file##doc/asciinema/} ; \
		echo $${texto} ; \
		asciinema cat $${file}  > ./doc/ansi/"$${texto}".txt  ; \
		ansi2txt < ./doc/ansi/"$${texto}".txt  > ./doc/txt/"$${texto}".txt ; \
		asciinema cat $${file}  | ansi2html --input-encoding=UTF-8 -imW > ./doc/html/$${texto}.html ; \
		sed -i 's/<span id/<br><span id/g' ./doc/html/$${texto}.html ; \
		wkhtmltopdf --encoding utf-8 ./doc/html/$${texto}.html ./doc/pdf/$${texto}.pdf ; \
		asciinema cat $${file}  | ansi2html -mL > ./doc/latex/$${texto}.tex; \
		sed -i -e 's|textcolor{ansi1 \(ansi[0-9]*\)}\({[^}]*}\)|textbf{\\textcolor{\1}\2}|g' 		./doc/latex/$${texto}.tex; \
	done
