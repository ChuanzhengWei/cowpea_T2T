RepeatMasker.py out2seqs HiTE.out genome.fa > whole_genome_te.fa
seqkit split2 -l 100000 whole_genome_te.fa -o whole_genome_te1.fa
TEsorter whole_genome_te1.fa -db rexdb-plant -p 6