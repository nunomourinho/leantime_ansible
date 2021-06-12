MYDIR = ./asciinema
documento: $(MYDIR)/*.cast
	for file in $^ ; do \
		asciinema cat $${file}  > ./txt/$${file}.txt; \
		asciinema cat $${file}  | ansi2html > ./html/$${file}.html; \
	done
	#asciinema cat $< | ansi2html -ip > html/$@
	#asciinema cat $< | ansi2html -mL > latex/$@
	#sed -i -e 's|textcolor{ansi1 \(ansi[0-9]*\)}\({[^}]*}\)|textbf{\\textcolor{\1}\2}|g' latex/$@
