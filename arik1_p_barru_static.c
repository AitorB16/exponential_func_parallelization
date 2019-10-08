/****************
  Konputagailuen Ingeniaritza - EHP

  arik1.c  --  serieko bertsioa
  OpenMPren oinarrizko kontzeptuak freskatzeko ariketa

*******************************************************/

#include <stdio.h>
#include <sys/time.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>


#define  ERR 200000
#define  ZUT 300
#define  ESKMAX 1000
#define  BALMAX 60


double   mat[ERR][ZUT];
struct timeval  t1, t0;


static void hasieratu_mat (double mat[ERR][ZUT])
{
  int i, j;


  for (i=0; i<ERR; i++)
  for (j=0; j<ZUT; j++)
    mat[i][j] = rand () % BALMAX - (j % 59);
}


int irakurri_eskaerak (char *feskaerak, int *zutabeak)
{
  FILE  *fitx;
  int   i, x;


  fitx = fopen (feskaerak, "r");

  i = x = 0;
  while (x != EOF) {
    x = fscanf (fitx, "%d", zutabeak + i);
    i++;
  }

  fclose (fitx);
  return (i-1);
}


void prozesatu_eskaerak (double mat[ERR][ZUT], int *zutabeak, int kop, double *emaitzak)
{
  int      i, j, zutabe;
  double   y, batura;

//  #pragma omp parallel for private(i,zutabe,batura,y) schedule(static)
  for (j=0; j<kop; j++)
  {
    zutabe = zutabeak[j];
    batura = 0.0;
#pragma omp parallel for private(y) reduction(+:batura) schedule(static)
    for (i=0; i<ERR; i++)
    {
      y = mat[i][zutabe];
      if (y > 0) batura += exp (y / 100); 
    }
    emaitzak[j] = batura;
  }
}


int main (int argc, char *argv[])
{
    int    i, esk_kop, zutabeak[ESKMAX];
    double  tex,tbb,tmax,tmin, *emaitzak;
    hasieratu_mat (mat);

    esk_kop = irakurri_eskaerak (argv[1], zutabeak);
    emaitzak = malloc (esk_kop * sizeof (double));


    gettimeofday (&t0, 0);

    prozesatu_eskaerak (mat, zutabeak, esk_kop, emaitzak);
    
    gettimeofday (&t1, 0);
    tex = (t1.tv_sec - t0.tv_sec) + (t1.tv_usec - t0.tv_usec) / 1e6;

// printf ("%d EXEKUZIOA\n  >> Eskaerak: %d  -- Azken batura: %1.3f  -- Tex: %1.1f ms \n\n",i, esk_kop, emaitzak[esk_kop - 1], tex*1000);

    tmax=0.0;
    tmin=DBL_MAX;
    tbb=0.0;

    for(i=0;i<10;i++){
    gettimeofday (&t0, 0);

    prozesatu_eskaerak (mat, zutabeak, esk_kop, emaitzak);

    gettimeofday (&t1, 0);
    tex = (t1.tv_sec - t0.tv_sec) + (t1.tv_usec - t0.tv_usec) / 1e6;
    printf ("%d EXEKUZIOA\n  >> Eskaerak: %d  -- Azken batura: %1.3f  -- Tex: %1.1f ms \n\n",i, esk_kop, emaitzak[esk_kop - 1], tex*1000);

    if(tex<tmin)
        tmin=tex;
    else if (tex>tmax)
        tmax=tex;
    tbb+=tex;
    }

    tbb=tbb/10;

    printf("#######################\n MAX: %1.1f ms MIN %1.1f ms BB %1.1f ms\n",tmax*1000,tmin*1000,tbb*1000);
    
    return (0);
}

