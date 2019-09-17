all: master.pdf

clean:
	rm -f programme.pdf master.pdf cropped.pdf programme-a0.pdf programme-a3.pdf programme-a4.pdf programme-a6.pdf *.aux *.log

cropped: cropped.pdf

programme-a4: programme-a4.pdf

programme-a3: programme-a3.pdf

programme-a0: programme-a0.pdf

programme-a6: programme-a6.pdf

programme-a4.pdf: programme-a6

programme-a0.pdf: programme-a6

programme-a3.pdf: programme-a6

programme-a6.pdf: cropped.pdf
	gs -sOutputFile=programme-a6.pdf -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dFirstPage=4 -dLastPage=16 cropped.pdf

programme-a4.pdf: programme-a6.pdf
	pdfjam --outfile programme-a4.pdf --paper a4paper --landscape programme-a6.pdf

programme-a0.pdf: programme-a6.pdf
	pdfjam --outfile programme-a0.pdf --trim "0.5cm 0.7cm 0.3cm 0.7cm" --clip true --paper a0paper --nup 2x4 --column true programme-a6.pdf

programme-a3.pdf: programme-a6.pdf
	pdfjam --outfile programme-a3.pdf --paper a4paper --landscape programme-a6.pdf

luafiles: $(shell find lua/ -type f -name "*.lua")

#master.pdf: *.tex icons/*.pdf images-print/*.pdf wallpaper/*.pdf sponsors/*.pdf images-print/*.tex
master.pdf: *.tex wallpaper/*.pdf images-print/*.pdf wallpaper/*.pdf icons/*.pdf luafiles
	lualatex master.tex -interaction=nonstopmode && lualatex -interaction=nonstopmode master.tex

cropped.pdf: master.pdf
	gs -o cropped.pdf -sDEVICE=pdfwrite -c "[/CropBox [28.3464 28.3464 325.9836 447.87312]" -c " /PAGES pdfmark" -dPDFSETTINGS=/prepress -f master.pdf

publish_cropped: cropped.pdf
	scp -C cropped.pdf 1blu-rootserver:/var/www/html/sotm/booklet19/

publish_master: master.pdf
	scp -C master.pdf 1blu-rootserver:/var/www/html/sotm/booklet19/

publish: publish_master publish_cropped
