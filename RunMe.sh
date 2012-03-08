for ttex in *.ttex 
do
  tex=`echo $ttex | sed 's/ttex/tex/'`
  swath -f latex -u u,u <$ttex> $tex
done
pdflatex bible.tex
