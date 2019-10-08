#!/bin/sh
#Konpilazioa
gcc -O2 -o ./arik1 ./arik1_seriean.c -lm
gcc -O2 -fopenmp -o ./arik1P1 ./arik1_p_kanp_static.c -lm
gcc -O2 -fopenmp -o ./arik1P2 ./arik1_p_kanp_dynamic.c -lm
gcc -O2 -fopenmp -o ./arik1P3 ./arik1_p_barru_static.c -lm
gcc -O2 -fopenmp -o ./arik1P4 ./arik1_p_barru_dynamic.c -lm


echo -----------------------------------------------------------------
echo Programa exekutatuko da: seriean, 2, 4, 8 eta 16 harirekin
echo -----------------------------------------------------------------

echo serieko bertsioa exekutatzen eta seriean.txt-en gordetzen
./arik1 ./f1 > ./seriean.txt
echo -----------------------------------------------------------------

#######################################  

echo ///PARALELO KANPOKO BEGIZTA STATIC > paraleloan.txt
echo ///PARALELO KANPOKO BEGIZTA STATIC

echo paraleloan 2 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=2
echo 2 HARI  >> paraleloan.txt
./arik1P1 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 4 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=4
echo 4 HARI  >> paraleloan.txt
./arik1P1 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 8 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=8
echo 8 HARI  >> paraleloan.txt
./arik1P1 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 16 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=16
echo 16 HARI  >> paraleloan.txt
./arik1P1 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt

#######################################  

echo ///PARALELO KONPOKO BEGIZTA DYNAMIC
echo ///PARALELO KONPOKO BEGIZTA DYNAMIC >> ./paraleloan.txt

echo paraleloan 2 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=2
echo 2 HARI  >> paraleloan.txt
./arik1P2 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 4 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=4
echo 4 HARI  >> paraleloan.txt
./arik1P2 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 8 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=8
echo 8 HARI  >> paraleloan.txt
./arik1P2 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 16 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=16
echo 16 HARI  >> paraleloan.txt
./arik1P2 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt

#######################################

echo ///PARALELO BARRUKO BEGIZTA STATIC 
echo ///PARALELO BARRUKO BEGIZTA STATIC  >> ./paraleloan.txt

echo paraleloan 2 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=2
echo 2 HARI  >> paraleloan.txt
./arik1P3 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 4 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=4
echo 4 HARI  >> paraleloan.txt
./arik1P3 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 8 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=8
echo 8 HARI  >> paraleloan.txt
./arik1P3 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 16 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=16
echo 16 HARI  >> paraleloan.txt
./arik1P3 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt

#######################################  

echo ///PARALELO BARRUKO BEGIZTA DYNAMIC
echo ///PARALELO BARRUKO BEGIZTA DYNAMIC >> ./paraleloan.txt

echo paraleloan 2 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=2
echo 2 HARI  >> paraleloan.txt
./arik1P4 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 4 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=4
echo 4 HARI  >> paraleloan.txt
./arik1P4 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 8 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=8
echo 8 HARI  >> paraleloan.txt
./arik1P4 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt


echo paraleloan 16 harirekin exekutatzen eta paraleloan.txt-en gordetzen
export OMP_NUM_THREADS=16
echo 16 HARI  >> paraleloan.txt
./arik1P4 ./f1 >> ./paraleloan.txt
echo -----------------------------------------------------------------
echo ----------------------------------------------------------------- >> ./paraleloan.txt

