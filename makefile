all: main.texw
	make result.pdf
	make main.pdf
.PHONY : all
result.tex: main.texw
	siweb -Rresult.tex main.texw > result.tex

main.tex: main.texw
	pweave -f texpweave main.texw

result.pdf: result.tex cos.cls
	xelatex --shell-escape result.tex

main.pdf: main.tex NGPLB.cls
	xelatex --shell-escape main.tex