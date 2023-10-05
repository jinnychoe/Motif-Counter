Motif Counter Script
=====================
About: 
-----
The Motif Counter Script is a bash script that performs two tasks.
1. It counts the number of times a target motifs appears in "r_bifella.fasta." The results are recorded in "motif_count.txt."
2. It creates a separate FASTA file for each motif. The FASTA file contains the genes and their sequences that have the target motif. It is saved in the "motifs" directory.

Motifs are read from a list of motifs from the "interesting_motifs.txt." 
The script finds the motifs in "r_bifella.fasta." 
The Bash command "grep" counts the total number of motifs in the "r_bifella.fasta" file.
The Bash command "awk" records the gene sequence in the motif FASTA file. 

Execute the script using Terminal in Ubuntu:
---------------------------------------------
1. The script `motif_counter.sh` should be in the same directory as `r_bifella.fasta` and `interesting_motifs.txt.` 

2. Using Terminal, navigate to that directory.

3. Give `motif_counter.sh` executable permissions using the following command:
		
chmod +x motif_counter.sh

4. Execute the script with the following command:

./motif_counter.sh

5. The following outputs will be generated:

The file "motif_count.txt" will be created. This file will contain a list of motifs from "interesting_motifs.txt" and the correspond counts from the 'r_bifella.fasta' file.
	
A directory named "motifs" will be created. This directory will contain a FASTA file for each motif. Each file will contain the genes that have the target motif. 
