#!/bin/bash

# make an output file to store motif counts
output_file="motif_count.txt"
> "$output_file"

# write header line to output file
echo -e "Motif\t\tCount" >> "$output_file"

# read each motif using line as delimiter using a while loop
while read -r motif; do
    # find motif in r_bifella.fasta file, pipe to wc to be counted
    count=$(grep -oF "$motif" r_bifella.fasta | wc -l)
    
    # write motif and total count to output file, output is also formatted.
     printf "%-10s\t%d\n" "$motif" "$count" >> "$output_file"

done < interesting_motifs.txt # end of loop, interesting_motifs.txt is input for loop

echo "Motifs have been counted in 'r_bifella.fasta' file and saved in  '$output_file'"

# make motifs directory if not there
mkdir -p motifs

# read each motif using line as delimiter using a while loop
while read -r motif; do
    # create a new output file for the current motif
    output_file="motifs/${motif}.fasta"

    # find genes containing motif in r_bifella.fasta
    awk -v pat="$motif" -v outfile="$output_file" '
        BEGIN { RS = ">" } # use > to separate input records, 
        $2 ~ pat { print ">" $0 } # prints the gene in FASTA format
    ' r_bifella.fasta > "$output_file" #redirect output of awk to output file

done < interesting_motifs.txt # end of loop, interesting_motifs.txt is input for loop

echo "Motif files have been created in the 'motifs' directory."
