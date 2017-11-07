#!/usr/bin/bash

spp=$1
ks=$2
abyss_asmb=$3
spades_asmb=$4

#headers
echo asmb spp k N50 L50 Length n_contigs LargestContig > quast_report.txt


for sp in $spp
do(
    for k in $ks
    do(
    N50=$(grep "N50" $sp/$abyss_asmb/$k/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    L50=$(grep "L50" $sp/$abyss_asmb/$k/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    Length=$(grep "Total length" $sp/$abyss_asmb/$k/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    contigs=$(grep "# contigs" $sp/$abyss_asmb/$k/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    largest=$(grep "Largest contig" $sp/$abyss_asmb/$k/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)

    echo abyss-scf $sp $k $N50 $L50 $Length $contigs $largest >> quast_report.txt
    )
    done
)
done




for sp in $spp
do(
    for k in $ks
    do(
    N50=$(grep "N50" $sp/$abyss_asmb/$k/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    L50=$(grep "L50" $sp/$abyss_asmb/$k/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    Length=$(grep "Total length" $sp/$abyss_asmb/$k/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    contigs=$(grep "# contigs" $sp/$abyss_asmb/$k/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
    largest=$(grep "Largest contig" $sp/$abyss_asmb/$k/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)

    echo abyss-ctg $sp $k $N50 $L50 $Length $contigs $largest >> quast_report.txt
    )
    done
)
done


for sp in $spp
do(

N50=$(grep "N50" $sp/$spades_asmb/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
L50=$(grep "L50" $sp/$spades_asmb/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
Length=$(grep "Total length" $sp/$spades_asmb/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
contigs=$(grep "# contigs" $sp/$spades_asmb/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
largest=$(grep "Largest contig" $sp/$spades_asmb/quast_scf_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)

echo spades-ctg $sp default $N50 $L50 $Length $contigs $largest >> quast_report.txt
)
done

for sp in $spp
do(

N50=$(grep "N50" $sp/$spades_asmb/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
L50=$(grep "L50" $sp/$spades_asmb/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
Length=$(grep "Total length" $sp/$spades_asmb/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
contigs=$(grep "# contigs" $sp/$spades_asmb/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)
largest=$(grep "Largest contig" $sp/$spades_asmb/quast_ctg_out/report.txt | grep -Eoe '-?[0-9.]+' | tail -n1)

echo spades-ctg $sp default $N50 $L50 $Length $contigs $largest >> quast_report.txt
)
done

