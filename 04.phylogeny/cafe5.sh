cafe5 --infile input.tab --tree input.tree --output_prefix cafe_ortho --cores 12

cat family_results.txt |grep "y"|cut -f 1 > OG.significant
grep -f OG.significant Base_change.tab > OG.change.tab

node=16
cat OG.change.tab | cut -f 1,${node} | awk '$2 >= 1 {print $1}' > node${node}significant.expand
cat OG.change.tab | cut -f 1,${node} | awk '$2 < 0 {print $1}' > node${node}significant.contract

grep -f node${node}significant.expand Orthogroups.txt | sed "s/ /\n/g" | grep "HJD" | sort | uniq  > node${node}significant.expand.genes
grep -f node${node}significant.contract Orthogroups.txt | sed "s/ /\n/g" | grep "HJD" | sort | uniq  > node${node}significant.contract.genes

cat node16significant.expand.genes | cut -d '#' -f 2 > tmp.HJD
grep -f tmp.HJD HJD.match.txt | cut -f 1 | cut -d '.' -f 1 > HJD.expand
cat node16significant.contract.genes | cut -d '#' -f 2 > tmp.HJD
grep -f tmp.HJD HJD.match.txt | cut -f 1 | cut -d '.' -f 1 > HJD.contract