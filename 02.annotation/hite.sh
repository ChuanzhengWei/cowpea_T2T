ln -s /public/home/weichuanzheng/software/singularity/sif/HiTE-3.2.0.sif ./
mkdir result
singularity run -B ${PWD}:${PWD} HiTE-3.2.0.sif python /HiTE/main.py \
 --genome HJD.fasta \
 --thread 48 \
 --plant 1 --recover 1 --annotate 1 \
 --outdir ./result
