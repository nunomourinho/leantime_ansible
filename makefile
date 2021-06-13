MYDIR = ./doc/asciinema
documentacao: $(MYDIR)/*.cast
	for file in $^ ; do \
		texto=$${file##doc/asciinema/} ; \
		echo $${texto} ; \
		asciinema cat $${file}  > ./doc/txt/"$${texto}".txt  ; \
		asciinema cat $${file}  | ansi2html -im > ./doc/html/$${texto}.html ; \
		wkhtmltopdf ./doc/html/$${texto}.html ./doc/pdf/$${texto}.pdf ; \
		asciinema cat $${file}  | ansi2html -mL > ./doc/latex/$${texto}.tex; \
		sed -i -e 's|textcolor{ansi1 \(ansi[0-9]*\)}\({[^}]*}\)|textbf{\\textcolor{\1}\2}|g' 		./doc/latex/$${texto}.tex; \
	done
