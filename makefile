MYDIR = /home/admlocal/leantime_ansible/doc/asciinema
MYVIDEO = /home/admlocal/leantime_ansible/doc/mp4
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

videos: $(MYDIR)/*.cast
	docker pull beer5215/asciicast2mp4
		for file in $^ ; do \
		base=$${file##*/} ; \
		docker run --rm -v ${MYDIR}:/data beer5215/asciicast2mp4 $${base} ; \
	done

gifs: $(MYDIR)/*.cast
	for file in $^ ; do \
		ficheiro=$${file##*/} ; \
		base=$${ficheiro%.cast} ; \
		ffmpeg -f image2 -framerate 4 -i ${MYVIDEO}/$${base}/%d.png -vf scale=1024x768,tpad=stop_mode=clone:stop_duration=20 ./doc/gif/$${base}.gif ; \
	done
