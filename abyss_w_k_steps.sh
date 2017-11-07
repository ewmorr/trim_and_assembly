for sp in Sp1 Sp2 Sp3 Spn; #With spp reads in individual dirs
do(
	echo Starting $sp
	mkdir abyss_assembly
	cd /root/path/to/$sp/abyss_assembly


	for k in 33 55 77 127;
	do(
		echo Starting k$k with default c
		mkdir k$k
		cd k$k
		abyss-pe k=$k name=k$k in='/root/path/to/$sp/paired_reads_1.fastq /root/path/to/$sp/paired_reads_2.fastq' #Or relative paths..
	);
	done

);
done
