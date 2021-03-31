
CWD=$(pwd)
for i in phenol ;
do
  echo "Setting up $i"
  for x in old bjm zero zerom bj;
  do
    echo "Setting up $i, $x"
    mkdir -p $i/$x
    cp dispersion_template.bash $i/$x/dispersion.bash
    sed -i "s=ROOT_DIR=onetep_xyz_out=g" $i/$x/dispersion.bash
    sed -i "s=OUT_NAME=${i}_${x}=g" $i/$x/dispersion.bash
    sed -i "s=OUT_DIR=.=g" $i/$x/dispersion.bash
    sed -i "s=DISP_FLAG=$x=g" $i/$x/dispersion.bash
    sed -i "s=LIG_NAME=${i}=g" $i/$x/dispersion.bash
    cd $i/$x
    bash dispersion.bash
    cd ../../
  done
done
