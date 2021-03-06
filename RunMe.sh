#!/bin/sh

run_swath(){
    for ttex in *.ttex 
    do
        tex=`echo $ttex | sed 's/ttex/tex/'`
        swath -f latex -u u,u <$ttex> $tex
    done
}

remove_temp_files(){
    rm -fr *.tex *.aux *.log *.toc
}

directories="ch01 ch02 ch03 ch04 ch05 ch06 ch07 ch08 ch09 ch10 ch11 ch12 ch13 ch14 ch15 ch16 ch17 ch18 ch19 ch20 ch21 ch22 ch23 ch24 ch25 ch26 ch27 ch28 ch29 ch30 ch31 ch32 ch33 ch34 ch35 ch36 ch37 ch38 ch39 ch40 ch41 ch42 ch43 ch44 ch45 ch46 ch47 ch48 ch49 ch50 ch51 ch52 ch53 ch54 ch55 ch56 ch57 ch58 ch59 ch60 ch61 ch62 ch63 ch64 ch65 ch66"
for directory in $directories;
do
    cd $directory
    run_swath
    cd ..
done

run_swath
pdflatex bible.tex # 1st run, create table of contents (*.toc)
pdflatex bible.tex # 2nd run, use toc

for directory in $directories;
do
    cd $directory
    remove_temp_files
    cd ..
done
remove_temp_files
