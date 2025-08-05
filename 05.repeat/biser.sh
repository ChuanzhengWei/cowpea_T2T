singularity exec biser.sif biser \
    --output FC6.sd \
    --temp /share/home/lfpara/project/biser/tmp/ \
    --keep-temp --max-error=20 --max-edit-error=10 --gc-heap 2G\
    -t 36 FC6.sm.fasta
