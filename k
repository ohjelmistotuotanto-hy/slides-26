k.pdf: kuvat.md
	pandoc --pdf-engine=tectonic -t beamer -V colortheme=crane kuvat.md -o k.pdf
