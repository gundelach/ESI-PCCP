Input and output files for GFN2-XTB calculations in XTB program

-sample_submissions  # sample submission scripts with XTB execution line
 -subscript_xtb_ligand/host/complex.slurm

-inputs # input xyz coordinate files for 100 snapshots, ligand set B
 -LigandName
  -complex #filename convention: complex/host/ligand_SnapshotNumber.xyz
  -host
  -ligand  

-outputs # output files from GFN2-XTB runs in XTB
 -LigandName
  -all output files # naming convention: complex/host/ligand_SnapshotNumber.xyz.out
