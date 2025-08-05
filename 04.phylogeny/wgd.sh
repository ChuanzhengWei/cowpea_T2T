wgd dmd HJD -o wgd_dmd -n 12
wgd ksd wgd_dmd/HJD.tsv HJD -o wgd_ksd -n 12
wgd syn -f mRNA -a Name wgd_dmd/HJD.tsv HJD.new.gff3 -ks wgd_ksd/HJD.tsv.ks.tsv -o wgd_syn -n 12
wgd dmd --globalmrbh HJD FC6 Vigna_radiata Phaseolus_vulgaris Glycine_max -o wgd_globalmrbh -n 12
wgd ksd wgd_globalmrbh/global_MRBH.tsv HJD FC6 Vigna_radiata Phaseolus_vulgaris Glycine_max -o wgd_globalmrbh_ks -n 12
wgd viz -d wgd_globalmrbh_ks/global_MRBH.tsv.ks.tsv -fa HJD -epk wgd_ksd/HJD.tsv.ks.tsv -ap wgd_syn/iadhore-out/anchorpoints.txt -sp speciestree.nwk -o wgd_viz_mixed_Ks --plotelmm --plotapgmm --reweight -n 12


sample="HJD"
wgd dmd ${sample} -o ${sample}wgd_dmd -n 12
wgd ksd ${sample}wgd_dmd/${sample}.tsv HJD -o ${sample}wgd_ksd -n 12
wgd syn -f mRNA -a ID ${sample}wgd_dmd/${sample}.tsv ${sample}.gff3 -ks ${sample}wgd_ksd/${sample}.tsv.ks.tsv -o ${sample}wgd_syn -n 12
wgd peak --heuristic ${sample}wgd_ksd/${sample}.tsv.ks.tsv -ap ${sample}wgd_syn/iadhore-out/anchorpoints.txt -sm ${sample}wgd_syn/iadhore-out/segments.txt -le ${sample}wgd_syn/iadhore-out/list_elements.txt -mp ${sample}wgd_syn/iadhore-out/multiplicon_pairs.txt -n 1 4 -kc 3 -o ${sample}wgd_peak
