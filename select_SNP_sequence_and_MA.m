%ref = 'AAGAGGCGGCCAGTGATAGCGTTCTGCCTCTTGATGATCCTATCTGCGATGGCTGTCACCCGCTTTCCCCCACAGCGTCCATCCGCCGGCCCAGACCCTGGTCCCATGGAGCCTCAGGGGGTAACTGGCGCCCCTGCAACCCATATCCGGCAGGCTTTGAGCTCCAGCCGGAGGCAGCGGGCAAGAAACATGGGCTTCTGGAGAAGCCGTGCTTTGCCCAGGAACTCCATCTTGGTCTGTGCTGAGGAGCAAGGCCATAGAGCAAGAG' %enter a ref sequence using 
%SNP_read_sequence(1,:) = ref
%for SNP_read_sequence_NO = 1:1:(SNP_read_NO-1)
%    SNP_read_sequence(SNP_read_sequence_NO,:) = SNP_read(SNP_read_sequence_NO).Sequence;
%end
%SNP_read_sequence((SNP_read_sequence_NO + 1),:) = ref
SNP_read_sequence_ma = multialign(SNP_read)

showalignment(SNP_read_sequence_ma)

%  seqalignviewer(SNP_read_sequence_ma)

%  distances = seqpdist(SNP_read_sequence,'Method','Jukes-Cantor','Alpha','DNA')
%  tree = seqlinkage(distances,'UPGMA')