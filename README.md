# Booklet of State of the Map 2019

## About this repository

This repository is for the source code of the booklet of [State of the Map 2019 conference](https://2019.stateofthemap.org/) in Heidelberg from 21 to 23 September 2019.

## Building

To build the booklet run:

```sh
lualatex master.tex
lualatex master.tex
```

… or just use the makefile.

Please note that this booklet is built using LuaLaTeX, not PDFLaTeX. Building
requires at least TeXlive 2016 due to the usage of the quite new
*scrlayer-scrpage2* package

## Builds

* [master branch](https://michreichert.de/sotm/booklet19/master.pdf)
* [final PDF](https://michreichert.de/sotm/booklet19/final.pdf)


## Contributing

The booklet has been sent to the print shop. Therefore, changes to the content, layout etc. do not have any benefit any more.

## License

This booklet is licensed under [Creative Commons Attribution Share-Alike 3.0](http://creativecommons.org/licenses/by-sa/3.0/) or newer if not otherwise stated. Logos and advertisements of companies and other organisations are not available under that license. The OpenStreetMap logo is available under the terms of [CC-BY-SA 2.0](http://creativecommons.org/licenses/by-sa/2.0/).

All maps are based on [OpenStreetMap](http://www.openstreetmap.org/copyright)
data, copyright OSM contributors, licensed [ODbL 1.0](http://opendatacommons.org/licenses/odbl/1-0/).

