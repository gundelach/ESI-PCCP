

for i in phenol ;
do
  echo "Setting up $i"
  for x in bjm bj ;
  do
    echo "Setting up $i $x"
    mkdir -p $i/$x
    cp three_body_template.bash $i/$x/three_body.bash
    sed -i "s=ROOT_DIR=onetep_xyz_out=g" $i/$x/three_body.bash
    sed -i "s=OUT_NAME=${i}_${x}=g" $i/$x/three_body.bash
    sed -i "s=OUT_DIR=.=g" $i/$x/three_body.bash
    sed -i "s=DISP_FLAG=$x=g" $i/$x/three_body.bash
    sed -i "s=LIG_NAME=${i}=g" $i/$x/three_body.bash
    cd $i/$x
    bash three_body.bash
    cd ../../
  done
done
