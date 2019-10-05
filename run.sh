#!/bin/sh
#Konpilazioa
gcc -O2 -o ./arik1 ./arik1_seriean.c -lm
gcc -O2 -fopenmp -o ./arik1P ./arik1_paraleloan.c -lm

echo -----------------------------------------------------------------
echo Programa exekutatuko da: seriean, 2, 4, 8 eta 16 harirekin
echo -----------------------------------------------------------------

echo serieko bertsioa exekutatzen eta seriean.txt-en gordetzen
./arik1 ./f1 > ./seriean.txt
echo -----------------------------------------------------------------

echo paraleloan 2 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=2
echo 2 HARI  > paraleloan.txt
./arik1P ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 4 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=4
echo 4 HARI  >> paraleloan.txt
./arik1P ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt

echo paraleloan 8 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=8
echo 8 HARI  >> paraleloan.txt
./arik1P ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 16 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=16
echo 16 HARI  >> paraleloan.txt
./arik1P ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


