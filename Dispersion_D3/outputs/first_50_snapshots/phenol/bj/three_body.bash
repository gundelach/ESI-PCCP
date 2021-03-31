# Modified scipt to get D3 Three body term

# functional
XC="pbe"
# inpyt flabs
FLAGS="-func $XC -bj -abc"
# directory of executable
SOURCE="/home/lg3u19/scratch/T4lysozyme/DispersionCorrection/D3"
# directory of dat files
ROOT="onetep_xyz_out"
# name of final output file
OUTFILE="phenol_bj.data"
# directory of output files
TARGET="."
# name of ligand
LIGNAME="phenol"


# loop over all ligand files, create ligand.data file in target directory
echo "looping over ligand snapshots"
echo "ligand" > $TARGET/ligand_abc.data
#for i in $ROOT/ligand/*.xyz;
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/ligand/ -name "*.xyz")
do 
  echo $i
  # call D3 programm from directory for file i and with flags and write into a temp file
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  # get the number of the snapshot
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  echo $SNAP
  # read three body dispersion energy from  temporary dump file
  VALUE=$(grep "E6(ABC) " $TARGET/disp.temp | awk '{ print $4 }' | head -n1)
  # write snaphost and dispersion energy into ligand.dat file
  echo "$SNAP $VALUE" >> $TARGET/ligand_abc.data
done

# repeat same thing for host and complex
echo "looping over host snapshots"
echo "host" > $TARGET/host_abc.data
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/host/ -name "*.xyz")
do 
  echo $i
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  VALUE=$(grep "E6(ABC) " $TARGET/disp.temp | awk '{ print $4 }' | head -n1)
  echo "$SNAP $VALUE" >> $TARGET/host_abc.data
done

echo "looping over complex snapshots"
echo "complex" > $TARGET/complex_abc.data
for i in $(find ../../${ROOT}/${LIGNAME}_xyz/complex/ -name "*.xyz")
do 
  echo $i
  $SOURCE/dftd3 $i $FLAGS > $TARGET/disp.temp
  SNAP=$(echo $i | cut -d "_" -f 5 | cut -d "." -f 1)
  VALUE=$(grep "E6(ABC) " $TARGET/disp.temp | awk '{ print $4 }' | head -n1)
  echo "$SNAP $VALUE" >> $TARGET/complex_abc.data
done



