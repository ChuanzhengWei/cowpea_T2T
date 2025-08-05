/public/home/weichuanzheng/software/hifiasm-0.20.0/hifiasm -t 96 -o HJD --telo-m CCCTAAA --dual-scaf --ul HJD.hifi.fastq.gz \
    --h1 HJD.hic_clean.R1.fastq.gz \
    --h2 HJD.hic_clean.R2.fastq.gz \
    HJD.hifi.fastq.gz 
awk '/^S/{print ">"$2;print $3}' HJD.hic.p_ctg.gfa > HJD.p_ctg.fa

verkko -d ./HJD \
  --hifi HJD.hifi.fastq.gz \
  --nano HJD.50K.fastq.gz \
  --hic1 HJD.hic_clean.R1.fastq.gz  \
  --hic2 HJD.hic_clean.R2.fastq.gz

nextDenovo run.cfg
[General]
job_type = local
job_prefix = nextDenovo
task = all
rewrite = yes
deltmp = yes 
parallel_jobs = 10
input_type = raw
read_type = ont
input_fofn = input_fofn
workdir = ./03.nextdenovo

[correct_option]
read_cutoff = 50k
genome_size = 550m
sort_options = -m 20g -t 48
minimap2_options_raw = -t 48
pa_correction = 3
correction_options = -p 15

[assemble_option]
minimap2_options_cns = -t 48
nextgraph_options = -a 1