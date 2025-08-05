contig=HJD.fchr.fasta
reads1=HJD.hic_clean.R1.fastq.gz
reads2=HJD.hic_clean.R2.fastq.gz
nchrs=11

bwa index ${contig}
bwa mem -5SP -t 48 ${contig} ${reads1} ${reads2} | samblaster | samtools view - -@ 48 -S -h -b -F 3340 -o HiC.bam
/public/home/weichuanzheng/software/HapHiC/utils/filter_bam HiC.bam 1 --nm 3 --threads 48 | samtools view - -b -@ 48 -o HiC.filtered.bam
/public/home/weichuanzheng/software/HapHiC/haphic pipeline ${contig} HiC.filtered.bam ${nchrs} --quick_view
/public/home/weichuanzheng/software/HapHiC/haphic plot /public/home/weichuanzheng/project/18.cowpea/04.hic/03.haphic2/04.build/scaffolds.raw.agp HiC.filtered.bam
cd 04.build
samtools faidx HJD.fchr.fasta
/public/home/weichuanzheng/software/HapHiC/scripts/../utils/juicer pre -a -q 1 -o out_JBAT /public/home/weichuanzheng/project/17.FC6/05.T2Tpaper/03.hic/03.FC6_HJD/HiC.filtered.bam scaffolds.raw.agp HJD.fchr.fasta.fai >out_JBAT.log 2>&1
(java -jar -Xmx32G /public/home/weichuanzheng/software/HapHiC/scripts/../utils/juicer_tools.1.9.9_jcuda.0.8.jar pre out_JBAT.txt out_JBAT.hic.part <(cat out_JBAT.log | grep PRE_C_SIZE | awk '{print $2" "$3}')) && (mv out_JBAT.hic.part out_JBAT.hic)

/public/home/weichuanzheng/software/HapHiC/utils/mock_agp_file.py HJD.fchr.fasta > chr_asm.agp
/public/home/weichuanzheng/software/HapHiC/haphic plot chr_asm.agp \
    --specified_scaffolds Chr01,Chr02,Chr03,Chr04,Chr05,Chr06,Chr07,Chr08,Chr09,Chr10,Chr11 HiC.filtered.bam

