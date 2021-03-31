Folders contain inputs and outputs for D2 and D3 dispersion calculations using Grimme's standalone D3 programme

-inputs
 -setup_scripts      #Usefull utility scripts to set up D3 calculations
 -xyz_structures     #Coordinate files for host, ligand and complex in .xyz format
  -ligand_xyz
   -host
   -ligand
   -comples

-outputs
 -first_50_snapshots # output energies for first 50 snapshots (Lig set A)
  -ligand
   -D2/D3 variant    # CSV files with ligand, host and complex dispersion, Three body dispersion (ABC) data for some methods too
 -second_50_snapshots # output energies for second 50 snapshots (to make up ligand set B)
  -ligand
   -D2/D3 variant    # CSV files with ligand, host and complex dispersion, Three body dispersion (ABC) data for some methods too

