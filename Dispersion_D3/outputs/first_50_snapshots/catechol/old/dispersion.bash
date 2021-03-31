

# functional
XC="pbe"
# inpyt flabs
FLAGS="-func $XC -old"
# directory of executable
SOURCE="/home/lg3u19/scratch/T4lysozyme/DispersionCorrection/D3"
# name of directory of xyz files    
ROOT="onetep_xyz_out"
# name of ligand
LIGNAME="catechol"
# name of final output file
OUTFILE="catechol_old.data"
# directory of output files
TARGET="."


# loop over all ligand files, create ligand.data file in target directory
echo "looping over ligand snapshots"
echo "ligand" > $TARGET/ligand.data
#for i in $ROOT/ligand/*.xyz;
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/ligand/ -name "*.xyz")
do 
  echo $i
  # call D3 programm from directory for file i and with flags and write into a temp file
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  # get the number of the snapshot
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  echo $SNAP
  # read dispersion energy from  temporary dump file
  VALUE=$(grep "Edisp" $TARGET/disp.temp | awk '{ print $3 }')
  # write snaphost and dispersion energy into ligand.dat file
  echo "$SNAP $VALUE" >> $TARGET/ligand.data
done

# repeat same thing for host and complex
echo "looping over host snapshots"
echo "host" > $TARGET/host.data
#for i in $ROOT/host/*.xyz;
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/host/ -name "*.xyz")
do 
  echo $i
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  VALUE=$(grep "Edisp" $TARGET/disp.temp | awk '{ print $3 }')
  echo "$SNAP $VALUE" >> $TARGET/host.data
done

echo "looping over complex snapshots"
echo "complex" > $TARGET/complex.data
#for i in $ROOT/complex/*.xyz;
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/complex/ -name "*.xyz")
do 
  echo $i
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  VALUE=$(grep "Edisp" $TARGET/disp.temp | awk '{ print $3 }')
  echo "$SNAP $VALUE" >> $TARGET/complex.data
done

# compine all three data files into one
#paste -d" " $TARGET/ligand.data $TARGET/host.data $TARGET/complex.data > $TARGET/disp.data
echo "Complete, output written to $TARGET/disp.data"



