#!/bin/bash

# build the Rnw files 
echo "tranfering RNW to TEX..."
R CMD BATCH fosastoc.R
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# remove the outputfile
echo "removing unused R output..."
rm fosastoc.Rout
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# make a first round with pdflatex for the 'aux' file
echo "creating first LaTeX output..."
pdflatex fosastoc.tex > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# make the glossaries
echo "create glossary..."
makeglossaries fosastoc > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# make a second round with pdflatex for references
echo "bind and place references..."
pdflatex fosastoc.tex > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# make the bibliography
echo "create the bibliography..."
bibtex fosastoc.aux > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

# make three further round with pdflatex to create the correct PDF
echo "bind and place the bibliography..."
pdflatex fosastoc.tex > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

echo "run first security build for LaTeX..."
pdflatex fosastoc.tex > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

echo "run second security build for LaTeX..."
pdflatex fosastoc.tex > /dev/null
echo -e "\t\t\t\t\t\t\t [ DONE ]"

