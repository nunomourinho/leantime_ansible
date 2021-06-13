from ansi2html.style import SCHEME
sol = SCHEME['solarized']
for i, n in enumerate(sol):
    print("\\definecolor{ansi3%s}{HTML}{%s}" % (i, n.strip('#').upper()))
