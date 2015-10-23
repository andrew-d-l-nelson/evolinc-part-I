Manual for Evolinc

Evolinc is a two-part pipeline to identify lincRNAs from an assembled transcriptome file (.gtf output) and then determine the extent to which those lincRNAs are conserved in the genome and transcriptome of other species. The first part of the pipeline is the lincRNA identification. The second part is the comparative genomics and transcriptomics analysis. You feed the data from A into B. The pipelines were kept separate in case users did not want to perform an evolutionary analysis on the identified lincRNAs. The process is highly dependent on quality of the genomes, transcriptomes, and overall annotation datasets being used. Even a couple of SNPs could lead to a transcript being miss-identified as either a lincRNA or a protein-coding gene. 


Evolinc_I: Identifying lincRNAs from RNAseq assembly:
Pre-requisites needed for Evolinc_part_I to run smoothly:
•	Cufflinks (https://github.com/cole-trapnell-lab/cufflinks)
•	NCBI BLAST (http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download)
•	Transdecoder-2.0.1 (the script will grab this program during each run)
•	Python 2.7 (https://www.python.org/download/releases/2.7/)

Files needed for part I:
•	extract_sequences-A.py
•	extract_sequences-B.py
•	fasta_header_rename.py
•	fasta_remove.py
•	filter_sequences.py
•	get_gene_length_filter.py
•	linc_RNA_filter-A.py
•	linc_RNA_filter-B.py
•	RNA_seq_out.gtf 
  o	Cuffcompare or cufflinks file.
•	Reference genome.fasta
•	Annotated_genes_for_reference_genome.fasta
  o	If available, you should include the 5’ and 3’UTR sequence for each gene. This will ensure that the RNAs you recover are actually intergenic.
•	Transposable_element_dataset.fasta
  o	This should include all the repeat elements you want to filter your lincRNAs against-miRNAs, snoRNAs, TEs, etc.

These files should all copied into the same folder.


To run the script:
sh lincRNA_pipeline.sh -c cuffcompare_or_cufflinks_output.gtf -g Genome_of_your_species_of_interest.fasta -r coding_gene_reference_file.fasta -b Repeat_element_database.fasta

Output should be: Final_filtered_lincRNAs.fasta
This file will be located in the newly created output folder.
