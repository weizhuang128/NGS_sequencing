function [ SNP_read ] = read_SNP_from_SAM( SAM,part_reads_start,part_reads_end,quality_data_seq_NO,SNP_read_NO)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

buffer_read = samread('D:\SRR1228245_blast.sam','blockread', [part_reads_start part_reads_end]);

   

            for  n = part_reads_start:1:part_reads_end
                 %read_quality = getMappingQuality(BMObj1,n)
                 this_read = buffer_read(n);
                 read_quality = this_read.MappingQuality;

                 if  read_quality > 5
                     extract_Data = this_read;
                     quality_data(quality_data_seq_NO,:) = extract_Data;
                     %quality_data(quality_data_seq_NO,:) = samread('G:\SRR1228245_blast.sam','blockread', n , 'tags', false)

                        %extract_DI = regexp(extract_Data.CigarString, '[^0-9SM]','match');%%if ^0-9SM output DI
                     if ~isempty (regexp(extract_Data.CigarString, '[^0-9SM]','match')) 

                         SNP_read(SNP_read_NO,:) = this_read;
                         SNP_read_NO = SNP_read_NO + 1;
                     end



                     quality_data_seq_NO = quality_data_seq_NO + 1;
                 end

            end

end

