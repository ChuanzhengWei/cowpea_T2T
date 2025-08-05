braker.pl --JAVA_PATH=/public/home/weichuanzheng/software/jdk/bin \
    --threads=20 --gff3 --species=HJD \
    --genome=HJD.softmask.fasta \
    --prot_seq=legume.fasta \
    --bam=leaf_RNASeq.bam,root_RNASeq.bam,seed_RNASeq.bam,stem_RNASeq.bam

singularity exec \
      -B $PWD/temp:/tmp \
       /public/home/weichuanzheng/software/singularity/PASA/pasapipeline.v2.5.3.simg \
        bash -c '  \
        cd /public/home/weichuanzheng/project/10.annotation/04.FC6/pasa/sample_data \
              && /usr/local/src/PASApipeline/Launch_PASA_pipeline.pl \
              -c sqlite.confs/alignAssembly.config \
              -C -R --ALIGNER gmap --CPU 1 \
              -g HJD.softmask.fasta -t transcript.fa'
singularity exec \
      -B $PWD/temp:/tmp \
       /public/home/weichuanzheng/software/singularity/PASA/pasapipeline.v2.5.3.simg \
        bash -c '  \
        cd /public/home/weichuanzheng/project/10.annotation/04.FC6/pasa/sample_data \
              && /usr/local/src/PASApipeline/scripts/Load_Current_Gene_Annotations.dbi \
              -c sqlite.confs/alignAssembly.config \
              -g HJD.softmask.fasta -P FC6.gff3'
singularity exec \
      -B $PWD/temp:/tmp \
       /public/home/weichuanzheng/software/singularity/PASA/pasapipeline.v2.5.3.simg \
        bash -c '  \
        cd /public/home/weichuanzheng/project/10.annotation/04.FC6/pasa/sample_data \
              && /usr/local/src/PASApipeline/Launch_PASA_pipeline.pl  \
              -c sqlite.confs/annotCompare.config \
              -A -g HJD.softmask.fasta -t transcript.fa'

