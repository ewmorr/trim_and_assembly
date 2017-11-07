Workflow for initial read trimming and assembly. QUAST checks for quality.

Do initial trimmming with trimmomatic

```
for sp in Sp1 Sp2 Sp3 Spn #with reads for individual spp in separate dirs
do(
cd $sp
trim_script.sh reads_1.fastq.gz reads_2.fastq.gz
)
done
```

Abyss assembly

```
nohup abyss_w_k_steps.sh &
```

Spades assembly 

```
for sp in Sp1 Sp2 Sp3 Spn #with reads for individual spp in separate dirs
do(
cd $sp
spades.py -1 paired_reads_1.fastq -2 paired_reads_2.fastq -o spades_assembly
)
done
```

Run quast for assembly quality

```
for sp in Sp1 Sp2 Sp3 Spn
do(
cd $sp

quast -o quast_ctg_out -t 24 spades_assembly/contigs.fasta
quast -o quast_scf_out -t 24 spades_assembly/scaffolds.fasta #spades scaffolds may not improve assembly quality with paired end reads only

	for k in k33 k55 k77 k127
	do(
	quast -o quast_ctg_out -t 24 abyss_assembly/$k/${k}-contigs.fa
	quast -o quast_scf_out -t 24 abyss_assembly/$k/${k}-scaffolds.fa
	)
	done
)
done
```

concatenate quast reports to a single file for plotting. The script can be modified if different assemblies performed.

```
concatenate_quast.sh "Sp1 Sp2 Sp3 Spn" "k33 k55 k77 k127" "abyss_assembly_dir" "spades_assembly_dir"
```


