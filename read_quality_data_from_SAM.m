clear;clc
file_name = 'H:\NGS\171114001PL_S13_L001_merged_001_Q30.sam'
%quality_data = this_read
%SNP_read = this_read
%BMObj1 = BioMap(file_name)
%seq_info = saminfo(file_name,'numofreads', true)
total_reads = 2286578 %    seq_info.NumReads    %%   16032728


quality_data_seq_NO = 1; %% mark the struct NO
SNP_read_NO = 1;
block_size = 100000 %% block_size
reads_cycle = fix(total_reads/block_size);


part_reads_start = 1
for total_m  = 1:1:reads_cycle
    
    part_reads_end = block_size * total_m; %%block_size up to 150bpreads 700000 overload RAM
    
    %tem_block_name = strcat('buffer_read_',int2str(total_m))
   
    %eval tem_block_name  = samread(file_name,'blockread', [part_reads_start part_reads_end]);

              buffer_read = samread(file_name,'blockread', [part_reads_start part_reads_end]);

            for  n = 1:1:block_size
                 %read_quality = getMappingQuality(BMObj1,n)
                 this_read = buffer_read(n);
                 read_quality = this_read.MappingQuality;
                 read_position = this_read.Position;

                 if  read_quality > 5 & read_position == 1
                     extract_Data = this_read;
                     %quality_data(quality_data_seq_NO,:) = extract_Data;
                     %quality_data(quality_data_seq_NO,:) = samread(file_name,'blockread', n , 'tags', false)

                        %extract_DI = regexp(extract_Data.CigarString, '[^0-9SM]','match');%%if ^0-9SM output DI
                     if ~isempty (regexp(extract_Data.CigarString, '[^0-9SM]','match')) 

                         SNP_read(SNP_read_NO,:) = this_read;
                         SNP_read_NO = SNP_read_NO + 1;
                     end



                     quality_data_seq_NO = quality_data_seq_NO + 1;
                 end

            end
 
 part_reads_start = part_reads_end + 1
end



SNP_read_sequence_ma = multialign(SNP_read)

showalignment(SNP_read_sequence_ma)
    
   
   


% Construct a BioMap object from a SAM file 
%BMObj1 = BioMap('ex1.sam');
% Set the Mapping Quality property of the second element to a new
% value 
%BMObj1 = setMappingQuality(BMObj1, 74, 2);


%%samread(file_name,'blockread', [200 1000], 'tags', false)
