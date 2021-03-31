Input and output files for DFT calculations in ONETEP 

Folder Structure:

-inputs   For 1000 snapshots of T4lysozyeme with 7 lignads
 -ligandname
  -dat_ligand Coordinate blocks for ligand
  -dat_host Coordinate blocks for host
  -dat_complex Coordinate blocks for complex
  -headers All other input blocks, one for host, ligand and complex

-outputs    For 50 ro 100 snapshots
 -ligand_outfiles 
  -functional_name Onetep outfiles for each snapshot and ligand 

-pseudos    All pseudopotential files requried 

Note:
Each header has a placeholder varaible XCNAME which must be changed to thte XC functional of choice
and DISPNUM which must be changed to dispersion method of choice.
To run ontep file the approprieate header for complex, host or ligand AND the .dat file containing the coordingate blcoks 
must be in the smae directory. Pseudos must also be in that directory. 
