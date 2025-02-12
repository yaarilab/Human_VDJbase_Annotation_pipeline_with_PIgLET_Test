$HOSTNAME = ""
params.outdir = 'results'  

//* params.nproc =  10  //* @input @description:"number of processes cores to use"
//* params.chain =  "IGH"  //* @input @description:"chain"

// Process Parameters for First_Alignment_IgBlastn:
params.First_Alignment_IgBlastn.num_threads = params.nproc
params.First_Alignment_IgBlastn.ig_seqtype = "Ig"
params.First_Alignment_IgBlastn.outfmt = "MakeDb"
params.First_Alignment_IgBlastn.num_alignments_V = "10"
params.First_Alignment_IgBlastn.domain_system = "imgt"

params.First_Alignment_MakeDb.failed = "true"
params.First_Alignment_MakeDb.format = "airr"
params.First_Alignment_MakeDb.regions = "default"
params.First_Alignment_MakeDb.extended = "true"
params.First_Alignment_MakeDb.asisid = "false"
params.First_Alignment_MakeDb.asiscalls = "false"
params.First_Alignment_MakeDb.inferjunction = "false"
params.First_Alignment_MakeDb.partial = "false"
params.First_Alignment_MakeDb.name_alignment = "_First_Alignment"

// Process Parameters for First_Alignment_Collapse_AIRRseq:
params.First_Alignment_Collapse_AIRRseq.name_alignment = "_First_Alignment"
params.First_Alignment_Collapse_AIRRseq.n_max = 10
params.First_Alignment_Collapse_AIRRseq.ncores = 20

// Process Parameters for Undocumented_Alleles:
params.Undocumented_Alleles.chain = params.chain
params.Undocumented_Alleles.num_threads = params.nproc
params.Undocumented_Alleles.germline_min = 200
params.Undocumented_Alleles.min_seqs = 50
params.Undocumented_Alleles.auto_mutrange = "true"
params.Undocumented_Alleles.mut_range = "1:10"
params.Undocumented_Alleles.pos_range = "1:318"
params.Undocumented_Alleles.y_intercept = 0.125
params.Undocumented_Alleles.alpha = 0.05
params.Undocumented_Alleles.j_max = 0.15
params.Undocumented_Alleles.min_frac = 0.75


// part 3

// Process Parameters for Second_Alignment_IgBlastn:
params.Second_Alignment_IgBlastn.num_threads = params.nproc
params.Second_Alignment_IgBlastn.ig_seqtype = "Ig"
params.Second_Alignment_IgBlastn.outfmt = "MakeDb"
params.Second_Alignment_IgBlastn.num_alignments_V = "10"
params.Second_Alignment_IgBlastn.domain_system = "imgt"

params.Second_Alignment_MakeDb.failed = "true"
params.Second_Alignment_MakeDb.format = "airr"
params.Second_Alignment_MakeDb.regions = "default"
params.Second_Alignment_MakeDb.extended = "true"
params.Second_Alignment_MakeDb.asisid = "false"
params.Second_Alignment_MakeDb.asiscalls = "false"
params.Second_Alignment_MakeDb.inferjunction = "false"
params.Second_Alignment_MakeDb.partial = "false"
params.Second_Alignment_MakeDb.name_alignment = "_Second_Alignment"

// part 4

// Process Parameters for Clone_AIRRseq_First_CreateGermlines:
params.Clone_AIRRseq_First_CreateGermlines.failed = "false"
params.Clone_AIRRseq_First_CreateGermlines.format = "airr"
params.Clone_AIRRseq_First_CreateGermlines.g = "dmask"
params.Clone_AIRRseq_First_CreateGermlines.cloned = "false"
params.Clone_AIRRseq_First_CreateGermlines.seq_field = ""
params.Clone_AIRRseq_First_CreateGermlines.v_field = ""
params.Clone_AIRRseq_First_CreateGermlines.d_field = ""
params.Clone_AIRRseq_First_CreateGermlines.j_field = ""
params.Clone_AIRRseq_First_CreateGermlines.clone_field = ""

params.Clone_AIRRseq_DefineClones.failed = "false"
params.Clone_AIRRseq_DefineClones.format = "airr"
params.Clone_AIRRseq_DefineClones.seq_field = ""
params.Clone_AIRRseq_DefineClones.v_field = ""
params.Clone_AIRRseq_DefineClones.d_field = ""
params.Clone_AIRRseq_DefineClones.j_field = ""
params.Clone_AIRRseq_DefineClones.group_fields =  ""
params.Clone_AIRRseq_DefineClones.mode = "gene"
params.Clone_AIRRseq_DefineClones.dist = "0.2"
params.Clone_AIRRseq_DefineClones.norm = "len"
params.Clone_AIRRseq_DefineClones.act = "set"
params.Clone_AIRRseq_DefineClones.model = "hh_s5f"
params.Clone_AIRRseq_DefineClones.sym = "min"
params.Clone_AIRRseq_DefineClones.link = "single"
params.Clone_AIRRseq_DefineClones.maxmiss = "0"

// Process Parameters for Clone_AIRRseq_Second_CreateGermlines:
params.Clone_AIRRseq_Second_CreateGermlines.failed = "false"
params.Clone_AIRRseq_Second_CreateGermlines.format = "airr"
params.Clone_AIRRseq_Second_CreateGermlines.g = "dmask"
params.Clone_AIRRseq_Second_CreateGermlines.cloned = "true"
params.Clone_AIRRseq_Second_CreateGermlines.seq_field = ""
params.Clone_AIRRseq_Second_CreateGermlines.v_field = ""
params.Clone_AIRRseq_Second_CreateGermlines.d_field = ""
params.Clone_AIRRseq_Second_CreateGermlines.j_field = ""
params.Clone_AIRRseq_Second_CreateGermlines.clone_field = ""


if (!params.v_germline){params.v_germline = ""} 
if (!params.d_germline){params.d_germline = ""} 
if (!params.j_germline){params.j_germline = ""} 
if (!params.airr_seq){params.airr_seq = ""} 
// Stage empty file to be used as an optional input where required
ch_empty_file_1 = file("$baseDir/.emptyfiles/NO_FILE_1", hidden:true)
ch_empty_file_2 = file("$baseDir/.emptyfiles/NO_FILE_2", hidden:true)
ch_empty_file_3 = file("$baseDir/.emptyfiles/NO_FILE_3", hidden:true)

Channel.fromPath(params.v_germline, type: 'any').map{ file -> tuple(file.baseName, file) }.set{g_2_germlineFastaFile_g_116}
Channel.fromPath(params.d_germline, type: 'any').map{ file -> tuple(file.baseName, file) }.set{g_3_germlineFastaFile_g_122}
Channel.fromPath(params.j_germline, type: 'any').map{ file -> tuple(file.baseName, file) }.set{g_4_germlineFastaFile_g_120}
Channel.fromPath(params.airr_seq, type: 'any').map{ file -> tuple(file.baseName, file) }.into{g_96_fastaFile_g111_12;g_96_fastaFile_g111_9}

g_4_germlineFastaFile_g_120= g_4_germlineFastaFile_g_120.ifEmpty([""]) 


process J_names_fasta {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*changes.csv$/) "genomic_novel_changes/$filename"}
input:
 set val(name), file(J_ref) from g_4_germlineFastaFile_g_120

output:
 set val("j_ref"), file("new_J_novel_germline*")  into g_120_germlineFastaFile0_g_114, g_120_germlineFastaFile0_g111_17, g_120_germlineFastaFile0_g111_12, g_120_germlineFastaFile0_g126_17, g_120_germlineFastaFile0_g126_12, g_120_germlineFastaFile0_g127_0, g_120_germlineFastaFile0_g127_1
 file "*changes.csv" optional true  into g_120_outputFileCSV1_g_124


script:

readArray_j_ref = J_ref.toString().split(' ')[0]

if(readArray_j_ref.endsWith("fasta")){

"""
#!/usr/bin/env python3 

import pandas as pd
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from hashlib import sha256 


def fasta_to_dataframe(file_path):
    data = {'ID': [], 'Sequence': []}
    with open(file_path, 'r') as file:
        for record in SeqIO.parse(file, 'fasta'):
            data['ID'].append(record.id)
            data['Sequence'].append(str(record.seq))

        df = pd.DataFrame(data)
        return df


file_path = '${readArray_j_ref}'  # Replace with the actual path
df = fasta_to_dataframe(file_path)


index_counter = 30  # Start index

for index, row in df.iterrows():
    if '_' in row['ID']:
        print(row['ID'])
        parts = row['ID'].split('*')
        row['ID'] = f"{parts[0]}*{index_counter}"
        # df.at[index, 'ID'] = row['ID']  # Update DataFrame with the new value
        index_counter += 1
        
        
        
def dataframe_to_fasta(df, output_file, description_column='Description', default_description=''):
    records = []

    for index, row in df.iterrows():
        sequence_record = SeqRecord(Seq(row['Sequence']), id=row['ID'])

        # Use the description from the DataFrame if available, otherwise use the default
        description = row.get(description_column, default_description)
        sequence_record.description = description

        records.append(sequence_record)

    with open(output_file, 'w') as output_handle:
        SeqIO.write(records, output_handle, 'fasta')

def save_changes_to_csv(old_df, new_df, output_file):
    changes = []
    for index, (old_row, new_row) in enumerate(zip(old_df.itertuples(), new_df.itertuples()), 1):
        if old_row.ID != new_row.ID:
            changes.append({'Row': index, 'Old_ID': old_row.ID, 'New_ID': new_row.ID})
    
    changes_df = pd.DataFrame(changes)
    if not changes_df.empty:
        changes_df.to_csv(output_file, index=False)


output_file_path = 'new_J_novel_germline.fasta'

dataframe_to_fasta(df, output_file_path)


file_path = '${readArray_j_ref}'  # Replace with the actual path
old_df = fasta_to_dataframe(file_path)

output_csv_file = "j_changes.csv"
save_changes_to_csv(old_df, df, output_csv_file)

"""
} else{
	
"""
#!/usr/bin/env python3 
	

file_path = 'new_J_novel_germline.txt'

with open(file_path, 'w'):
    pass
    
"""    
}    
}


process make_igblast_annotate_j {

input:
 set val(db_name), file(germlineFile) from g_120_germlineFastaFile0_g_114

output:
 file aux_file  into g_114_outputFileTxt0_g111_9, g_114_outputFileTxt0_g126_9

script:



aux_file = "J.aux"

"""
annotate_j ${germlineFile} ${aux_file}
"""
}


process Second_Alignment_J_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_120_germlineFastaFile0_g126_17

output:
 file "${db_name}"  into g126_17_germlineDb0_g126_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}


process First_Alignment_J_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_120_germlineFastaFile0_g111_17

output:
 file "${db_name}"  into g111_17_germlineDb0_g111_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}


process change_novel_to_not {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*changes.csv$/) "genomic_novel_changes/$filename"}
input:
 set val(name), file(v_ref) from g_2_germlineFastaFile_g_116

output:
 set val("v_ref"), file("new_V*")  into g_116_germlineFastaFile0_g_8, g_116_germlineFastaFile0_g111_22, g_116_germlineFastaFile0_g111_12
 file "*changes.csv" optional true  into g_116_csvFile1_g_124


script:

readArray_v_ref = v_ref.toString().split(' ')[0]

if(readArray_v_ref.endsWith("fasta")){

"""
#!/usr/bin/env python3 

import pandas as pd
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from hashlib import sha256 


def fasta_to_dataframe(file_path):
    data = {'ID': [], 'Sequence': []}
    with open(file_path, 'r') as file:
        for record in SeqIO.parse(file, 'fasta'):
            data['ID'].append(record.id)
            data['Sequence'].append(str(record.seq))

        df = pd.DataFrame(data)
        return df


file_path = '${readArray_v_ref}'  # Replace with the actual path
df = fasta_to_dataframe(file_path)

index_counter = 30  # Start index

for index, row in df.iterrows():
    if '_' in row['ID']:
        print(row['ID'])
        parts = row['ID'].split('*')
        row['ID'] = f"{parts[0]}*{index_counter}"
        # df.at[index, 'ID'] = row['ID']  # Update DataFrame with the new value
        index_counter += 1
        
        
        
def dataframe_to_fasta(df, output_file, description_column='Description', default_description=''):
    records = []

    for index, row in df.iterrows():
        sequence_record = SeqRecord(Seq(row['Sequence']), id=row['ID'])

        # Use the description from the DataFrame if available, otherwise use the default
        description = row.get(description_column, default_description)
        sequence_record.description = description

        records.append(sequence_record)

    with open(output_file, 'w') as output_handle:
        SeqIO.write(records, output_handle, 'fasta')

def save_changes_to_csv(old_df, new_df, output_file):
    changes = []
    for index, (old_row, new_row) in enumerate(zip(old_df.itertuples(), new_df.itertuples()), 1):
        if old_row.ID != new_row.ID:
            changes.append({'Row': index, 'Old_ID': old_row.ID, 'New_ID': new_row.ID})
    
    changes_df = pd.DataFrame(changes)
    if not changes_df.empty:
        changes_df.to_csv(output_file, index=False)
        
output_file_path = 'new_V.fasta'

dataframe_to_fasta(df, output_file_path)


file_path = '${readArray_v_ref}'  # Replace with the actual path
old_df = fasta_to_dataframe(file_path)

output_csv_file = "v_changes.csv"
save_changes_to_csv(old_df, df, output_csv_file)

"""
} else{
	
"""
#!/usr/bin/env python3 
	

file_path = 'new_V.txt'

with open(file_path, 'w'):
    pass
    
"""    
}    
}


process First_Alignment_V_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_116_germlineFastaFile0_g111_22

output:
 file "${db_name}"  into g111_22_germlineDb0_g111_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}

g_3_germlineFastaFile_g_122= g_3_germlineFastaFile_g_122.ifEmpty([""]) 


process D_names_fasta {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*changes.csv$/) "genomic_novel_changes/$filename"}
input:
 set val(name), file(D_ref) from g_3_germlineFastaFile_g_122

output:
 set val("d_ref"), file("new_D_novel_germline*")  into g_122_germlineFastaFile0_g111_16, g_122_germlineFastaFile0_g111_12, g_122_germlineFastaFile0_g126_16, g_122_germlineFastaFile0_g126_12, g_122_germlineFastaFile0_g127_0, g_122_germlineFastaFile0_g127_1
 file "*changes.csv" optional true  into g_122_outputFileCSV1_g_124


script:

readArray_D_ref = D_ref.toString().split(' ')[0]

if(readArray_D_ref.endsWith("fasta")){

"""
#!/usr/bin/env python3 

import pandas as pd
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from hashlib import sha256 


def fasta_to_dataframe(file_path):
    data = {'ID': [], 'Sequence': []}
    with open(file_path, 'r') as file:
        for record in SeqIO.parse(file, 'fasta'):
            data['ID'].append(record.id)
            data['Sequence'].append(str(record.seq))

        df = pd.DataFrame(data)
        return df


file_path = '${readArray_D_ref}'  # Replace with the actual path
df = fasta_to_dataframe(file_path)


index_counter = 30  # Start index

for index, row in df.iterrows():
    if '_' in row['ID']:
        print(row['ID'])
        parts = row['ID'].split('*')
        row['ID'] = f"{parts[0]}*{index_counter}"
        # df.at[index, 'ID'] = row['ID']  # Update DataFrame with the new value
        index_counter += 1
        
        
        
def dataframe_to_fasta(df, output_file, description_column='Description', default_description=''):
    records = []

    for index, row in df.iterrows():
        sequence_record = SeqRecord(Seq(row['Sequence']), id=row['ID'])

        # Use the description from the DataFrame if available, otherwise use the default
        description = row.get(description_column, default_description)
        sequence_record.description = description

        records.append(sequence_record)

    with open(output_file, 'w') as output_handle:
        SeqIO.write(records, output_handle, 'fasta')

def save_changes_to_csv(old_df, new_df, output_file):
    changes = []
    for index, (old_row, new_row) in enumerate(zip(old_df.itertuples(), new_df.itertuples()), 1):
        if old_row.ID != new_row.ID:
            changes.append({'Row': index, 'Old_ID': old_row.ID, 'New_ID': new_row.ID})
    
    changes_df = pd.DataFrame(changes)
    if not changes_df.empty:
        changes_df.to_csv(output_file, index=False)
        
output_file_path = 'new_D_novel_germline.fasta'

dataframe_to_fasta(df, output_file_path)


file_path = '${readArray_D_ref}'  # Replace with the actual path
old_df = fasta_to_dataframe(file_path)

output_csv_file = "d_changes.csv"
save_changes_to_csv(old_df, df, output_csv_file)

"""
} else{
	
"""
#!/usr/bin/env python3 
	

file_path = 'new_D_novel_germline.txt'

with open(file_path, 'w'):
    pass
    
"""    
}    
}


process Second_Alignment_D_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_122_germlineFastaFile0_g126_16

output:
 file "${db_name}"  into g126_16_germlineDb0_g126_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}


process First_Alignment_D_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_122_germlineFastaFile0_g111_16

output:
 file "${db_name}"  into g111_16_germlineDb0_g111_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}


process First_Alignment_IgBlastn {

input:
 set val(name),file(fastaFile) from g_96_fastaFile_g111_9
 file db_v from g111_22_germlineDb0_g111_9
 file db_d from g111_16_germlineDb0_g111_9
 file db_j from g111_17_germlineDb0_g111_9
 file custom_internal_data from g_114_outputFileTxt0_g111_9

output:
 set val(name), file("${outfile}") optional true  into g111_9_igblastOut0_g111_12

script:
num_threads = params.First_Alignment_IgBlastn.num_threads
ig_seqtype = params.First_Alignment_IgBlastn.ig_seqtype
outfmt = params.First_Alignment_IgBlastn.outfmt
num_alignments_V = params.First_Alignment_IgBlastn.num_alignments_V
domain_system = params.First_Alignment_IgBlastn.domain_system

randomString = org.apache.commons.lang.RandomStringUtils.random(9, true, true)
outname = name + "_" + randomString
outfile = (outfmt=="MakeDb") ? name+"_"+randomString+".out" : name+"_"+randomString+".tsv"
outfmt = (outfmt=="MakeDb") ? "'7 std qseq sseq btop'" : "19"

if(db_v.toString()!="" && db_d.toString()!="" && db_j.toString()!=""){
	"""
	export IGDATA=/usr/local/share/igblast
	
	igblastn -query ${fastaFile} \
		-germline_db_V ${db_v}/${db_v} \
		-germline_db_D ${db_d}/${db_d} \
		-germline_db_J ${db_j}/${db_j} \
		-num_alignments_V ${num_alignments_V} \
		-domain_system imgt \
		-auxiliary_data ${custom_internal_data} \
		-outfmt ${outfmt} \
		-num_threads ${num_threads} \
		-out ${outfile}
	"""
}else{
	"""
	"""
}

}


process First_Alignment_MakeDb {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_db-pass.tsv$/) "initial_annotation/$filename"}
publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_db-fail.tsv$/) "initial_annotation/$filename"}
input:
 set val(name),file(fastaFile) from g_96_fastaFile_g111_12
 set val(name_igblast),file(igblastOut) from g111_9_igblastOut0_g111_12
 set val(name1), file(v_germline_file) from g_116_germlineFastaFile0_g111_12
 set val(name2), file(d_germline_file) from g_122_germlineFastaFile0_g111_12
 set val(name3), file(j_germline_file) from g_120_germlineFastaFile0_g111_12

output:
 set val(name_igblast),file("*_db-pass.tsv") optional true  into g111_12_outputFileTSV0_g111_19
 set val("reference_set"), file("${reference_set}") optional true  into g111_12_germlineFastaFile11
 set val(name_igblast),file("*_db-fail.tsv") optional true  into g111_12_outputFileTSV22

script:

failed = params.First_Alignment_MakeDb.failed
format = params.First_Alignment_MakeDb.format
regions = params.First_Alignment_MakeDb.regions
extended = params.First_Alignment_MakeDb.extended
asisid = params.First_Alignment_MakeDb.asisid
asiscalls = params.First_Alignment_MakeDb.asiscalls
inferjunction = params.First_Alignment_MakeDb.inferjunction
partial = params.First_Alignment_MakeDb.partial
name_alignment = params.First_Alignment_MakeDb.name_alignment

failed = (failed=="true") ? "--failed" : ""
format = (format=="changeo") ? "--format changeo" : ""
extended = (extended=="true") ? "--extended" : ""
regions = (regions=="rhesus-igl") ? "--regions rhesus-igl" : ""
asisid = (asisid=="true") ? "--asis-id" : ""
asiscalls = (asiscalls=="true") ? "--asis-calls" : ""
inferjunction = (inferjunction=="true") ? "--infer-junction" : ""
partial = (partial=="true") ? "--partial" : ""

reference_set = "reference_set_makedb_"+name_alignment+".fasta"

outname = name_igblast+'_'+name_alignment

if(igblastOut.getName().endsWith(".out")){
	"""
	
	cat ${v_germline_file} ${d_germline_file} ${j_germline_file} > ${reference_set}
	
	MakeDb.py igblast \
		-s ${fastaFile} \
		-i ${igblastOut} \
		-r ${v_germline_file} ${d_germline_file} ${j_germline_file} \
		--log MD_${name}.log \
		--outname ${outname}\
		${extended} \
		${failed} \
		${format} \
		${regions} \
		${asisid} \
		${asiscalls} \
		${inferjunction} \
		${partial}
	"""
}else{
	"""
	
	"""
}

}


process First_Alignment_Collapse_AIRRseq {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /${outfile}+passed.tsv$/) "initial_annotation/$filename"}
input:
 set val(name),file(airrFile) from g111_12_outputFileTSV0_g111_19

output:
 set val(name), file("${outfile}"+"passed.tsv") optional true  into g111_19_outputFileTSV0_g_8, g111_19_outputFileTSV0_g_80
 set val(name), file("${outfile}"+"failed*") optional true  into g111_19_outputFileTSV11

script:
conscount_min = params.First_Alignment_Collapse_AIRRseq.conscount_min
n_max = params.First_Alignment_Collapse_AIRRseq.n_max
name_alignment = params.First_Alignment_Collapse_AIRRseq.name_alignment


outfile = airrFile.toString() - '.tsv' + name_alignment + "_collapsed-"

if(airrFile.getName().endsWith(".tsv")){	
	"""
	#!/usr/bin/env python3
	
	from pprint import pprint
	from collections import OrderedDict,Counter
	import itertools as it
	import datetime
	import pandas as pd
	import glob, os
	import numpy as np
	import re
	
	# column types default
	
	dtype_default={'junction_length': 'Int64', 'np1_length': 'Int64', 'np2_length': 'Int64', 'v_sequence_start': 'Int64', 'v_sequence_end': 'Int64', 'v_germline_start': 'Int64', 'v_germline_end': 'Int64', 'd_sequence_start': 'Int64', 'd_sequence_end': 'Int64', 'd_germline_start': 'Int64', 'd_germline_end': 'Int64', 'j_sequence_start': 'Int64', 'j_sequence_end': 'Int64', 'j_germline_start': 'Int64', 'j_germline_end': 'Int64', 'v_score': 'float', 'v_identity': 'float', 'v_support': 'Int64', 'd_score': 'float', 'd_identity': 'float', 'd_support': 'float', 'j_score': 'float', 'j_identity': 'float', 'j_support': 'float'}
	
	SPLITSIZE=2
	
	class CollapseDict:
	    def __init__(self,iterable=(),_depth=0,
	                 nlim=10,conscount_flag=False):
	        self.lowqual={}
	        self.seqs = {}
	        self.children = {}
	        self.depth=_depth
	        self.nlim=nlim
	        self.conscount=conscount_flag
	        for fseq in iterable:
	            self.add(fseq)
	
	    def split(self):
	        newseqs = {}
	        for seq in self.seqs:
	            if len(seq)==self.depth:
	                newseqs[seq]=self.seqs[seq]
	            else:
	                if seq[self.depth] not in self.children:
	                    self.children[seq[self.depth]] = CollapseDict(_depth=self.depth+1)
	                self.children[seq[self.depth]].add(self.seqs[seq],seq)
	        self.seqs=newseqs
	
	    def add(self,fseq,key=None):
	        #if 'duplicate_count' not in fseq: fseq['duplicate_count']='1'
	        if 'KEY' not in fseq:
	            fseq['KEY']=fseq['sequence_vdj'].replace('-','').replace('.','')
	        if 'ISOTYPECOUNTER' not in fseq:
	            fseq['ISOTYPECOUNTER']=Counter([fseq['c_call']])
	        if 'VGENECOUNTER' not in fseq:
	            fseq['VGENECOUNTER']=Counter([fseq['v_call']])
	        if 'JGENECOUNTER' not in fseq:
	            fseq['JGENECOUNTER']=Counter([fseq['j_call']])
	        if key is None:
	            key=fseq['KEY']
	        if self.depth==0:
	            if (not fseq['j_call'] or not fseq['v_call']):
	                return
	            if fseq['sequence_vdj'].count('N')>self.nlim:
	                if key in self.lowqual:
	                    self.lowqual[key] = combine(self.lowqual[key],fseq,self.conscount)
	                else:
	                    self.lowqual[key] = fseq
	                return
	        if len(self.seqs)>SPLITSIZE:
	            self.split()
	        if key in self.seqs:
	            self.seqs[key] = combine(self.seqs[key],fseq,self.conscount)
	        elif (self.children is not None and
	              len(key)>self.depth and
	              key[self.depth] in self.children):
	            self.children[key[self.depth]].add(fseq,key)
	        else:
	            self.seqs[key] = fseq
	
	    def __iter__(self):
	        yield from self.seqs.items()
	        for d in self.children.values():
	            yield from d
	        yield from self.lowqual.items()
	
	    def neighbors(self,seq):
	        def nfil(x): return similar(seq,x)
	        yield from filter(nfil,self.seqs)
	        if len(seq)>self.depth:
	            for d in [self.children[c]
	                      for c in self.children
	                      if c=='N' or seq[self.depth]=='N' or c==seq[self.depth]]:
	                yield from d.neighbors(seq)
	
	    def fixedseqs(self):
	        return self
	        ncd = CollapseDict()
	        for seq,fseq in self:
	            newseq=seq
	            if 'N' in seq:
	                newseq=consensus(seq,self.neighbors(seq))
	                fseq['KEY']=newseq
	            ncd.add(fseq,newseq)
	        return ncd
	
	
	    def __len__(self):
	        return len(self.seqs)+sum(len(c) for c in self.children.values())+len(self.lowqual)
	
	def combine(f1,f2, conscount_flag):
	    def val(f): return -f['KEY'].count('N'),(int(f['consensus_count']) if 'consensus_count' in f else 0)
	    targ = (f1 if val(f1) >= val(f2) else f2).copy()
	    if conscount_flag:
	        targ['consensus_count'] =  int(f1['consensus_count'])+int(f2['consensus_count'])
	    targ['duplicate_count'] =  int(f1['duplicate_count'])+int(f2['duplicate_count'])
	    targ['ISOTYPECOUNTER'] = f1['ISOTYPECOUNTER']+f2['ISOTYPECOUNTER']
	    targ['VGENECOUNTER'] = f1['VGENECOUNTER']+f2['VGENECOUNTER']
	    targ['JGENECOUNTER'] = f1['JGENECOUNTER']+f2['JGENECOUNTER']
	    return targ
	
	def similar(s1,s2):
	    return len(s1)==len(s2) and all((n1==n2 or n1=='N' or n2=='N')
	                                  for n1,n2 in zip(s1,s2))
	
	def basecon(bases):
	    bases.discard('N')
	    if len(bases)==1: return bases.pop()
	    else: return 'N'
	
	def consensus(seq,A):
	    return ''.join((basecon(set(B)) if s=='N' else s) for (s,B) in zip(seq,zip(*A)))
	
	n_lim = int('${n_max}')
	conscount_filter = int('${conscount_min}')
	
	df = pd.read_csv('${airrFile}', sep = '\t') #, dtype = dtype_default)
	
	# make sure that all columns are int64 for createGermline
	idx_col = df.columns.get_loc("cdr3")
	cols =  [col for col in df.iloc[:,0:idx_col].select_dtypes('float64').columns.values.tolist() if not re.search('support|score|identity|freq', col)]
	df[cols] = df[cols].apply(lambda x: pd.to_numeric(x.replace("<NA>",np.NaN), errors = "coerce").astype("Int64"))
	
	conscount_flag = False
	if 'consensus_count' in df: conscount_flag = True
	if not 'duplicate_count' in df:
	    df['duplicate_count'] = 1
	if not 'c_call' in df or not 'isotype' in df or not 'prcons' in df or not 'primer' in df or not 'reverse_primer' in df:
	    if 'c_call' in df:
	        df['c_call'] = df['c_call']
	    elif 'isotype' in df:
	        df['c_call'] = df['isotype']
	    elif 'primer' in df:
	        df['c_call'] = df['primer']
	    elif 'reverse_primer' in df:
	        df['c_call'] = df['reverse_primer']    
	    elif 'prcons' in df:
	        df['c_call'] = df['prcons']
	    elif 'barcode' in df:
	        df['c_call'] = df['barcode']
	    else:
	        df['c_call'] = 'Ig'
	
	# removing sequenes with duplicated sequence id    
	dup_n = df[df.columns[0]].count()
	df = df.drop_duplicates(subset='sequence_id', keep='first')
	dup_n = str(dup_n - df[df.columns[0]].count())
	df['c_call'] = df['c_call'].astype('str').replace('<NA>','Ig')
	#df['consensus_count'].fillna(2, inplace=True)
	nrow_i = df[df.columns[0]].count()
	df = df[df.apply(lambda x: x['sequence_alignment'][0:(x['v_germline_end']-1)].count('N')<=n_lim, axis = 1)]
	low_n = str(nrow_i-df[df.columns[0]].count())
	
	df['sequence_vdj'] = df.apply(lambda x: x['sequence_alignment'].replace('-','').replace('.',''), axis = 1)
	header=list(df.columns)
	fasta_ = df.to_dict(orient='records')
	c = CollapseDict(fasta_,nlim=10)
	d=c.fixedseqs()
	header.append('ISOTYPECOUNTER')
	header.append('VGENECOUNTER')
	header.append('JGENECOUNTER')
	
	rec_list = []
	for i, f in enumerate(d):
	    rec=f[1]
	    rec['sequence']=rec['KEY']
	    rec['consensus_count']=int(rec['consensus_count']) if conscount_flag else None
	    rec['duplicate_count']=int(rec['duplicate_count'])
	    rec_list.append(rec)
	df2 = pd.DataFrame(rec_list, columns = header)        
	
	df2 = df2.drop('sequence_vdj', axis=1)
	
	collapse_n = str(df[df.columns[0]].count()-df2[df2.columns[0]].count())

	# removing sequences without J assignment and non functional
	nrow_i = df2[df2.columns[0]].count()
	cond = (~df2['j_call'].str.contains('J')|df2['productive'].isin(['F','FALSE','False']))
	df_non = df2[cond]
	
	
	df2 = df2[df2['productive'].isin(['T','TRUE','True'])]
	cond = ~(df2['j_call'].str.contains('J'))
	df2 = df2.drop(df2[cond].index.values)
	
	non_n = nrow_i-df2[df2.columns[0]].count()
	#if conscount_flag:
	#   df2['consensus_count'] = df2['consensus_count'].replace(1,2)
	
	# removing sequences with low cons count
	
	filter_column = "duplicate_count"
	if conscount_flag: filter_column = "consensus_count"
	df_cons_low = df2[df2[filter_column]<conscount_filter]
	nrow_i = df2[df2.columns[0]].count()
	df2 = df2[df2[filter_column]>=conscount_filter]
	
	
	cons_n = str(nrow_i-df2[df2.columns[0]].count())
	nrow_i = df2[df2.columns[0]].count()    
	
	for col, dtype in dtype_default.items():
	    if "Int" in dtype:  # For integer columns
	        df[col] = df[col].fillna(-1).round(0).astype('Int64')  # Replace NaN and round to integers
	    elif "float" in dtype:  # For float columns
	        df[col] = df[col].astype('float')
    
	df2.to_csv('${outfile}'+'passed.tsv', encoding="utf-8", index=False, sep = "\t", float_format="%.6f", na_rep="NA") #, compression='gzip'
	
	pd.concat([df_cons_low,df_non]).to_csv('${outfile}'+'failed.tsv', sep = '\t',index=False)
	
	print(str(low_n)+' Sequences had N count over 10')
	print(str(dup_n)+' Sequences had a duplicated sequnece id')
	print(str(collapse_n)+' Sequences were collapsed')
	print(str(df_non[df_non.columns[0]].count())+' Sequences were declared non functional or lacked a J assignment')
	#print(str(df_cons_low[df_cons_low.columns[0]].count())+' Sequences had a '+filter_column+' lower than threshold')
	print('Going forward with '+str(df2[df2.columns[0]].count())+' sequences')
	
	"""
}else{
	"""
	
	"""
}

}


process airrseq_to_fasta {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /outfile$/) "airrseq_fasta/$filename"}
input:
 set val(name), file(airrseq_data) from g111_19_outputFileTSV0_g_80

output:
 set val(name), file(outfile)  into g_80_germlineFastaFile0_g126_12, g_80_germlineFastaFile0_g126_9

script:

outfile = name+"_collapsed_seq.fasta"

"""
#!/usr/bin/env Rscript

data <- data.table::fread("${airrseq_data}", stringsAsFactors = F, data.table = F)

data_columns <- names(data)

# take extra columns after cdr3

idx_cdr <- which(data_columns=="cdr3")+1

add_columns <- data_columns[idx_cdr:length(data_columns)]

unique_information <- unique(c("sequence_id", "duplicate_count", "consensus_count", "c_call", add_columns))

unique_information <- unique_information[unique_information %in% data_columns]

seqs <- data[["sequence"]]

seqs_name <-
  sapply(1:nrow(data), function(x) {
    paste0(unique_information,
           rep('=', length(unique_information)),
           data[x, unique_information],
           collapse = '|')
  })
seqs_name <- gsub('sequence_id=', '', seqs_name, fixed = T)

tigger::writeFasta(setNames(seqs, seqs_name), "${outfile}")

"""
}

if(params.container.startsWith("peresay")){
	cmd = 'source("/usr/local/bin/functions_tigger.R")'
}else{
	cmd = 'library(tigger)'
}
process Undocumented_Alleles {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*novel-passed.tsv$/) "novel_report/$filename"}
input:
 set val(name),file(airr_file) from g111_19_outputFileTSV0_g_8
 set val(v_germline_name), file(v_germline_file) from g_116_germlineFastaFile0_g_8

output:
 set val(name),file("*novel-passed.tsv") optional true  into g_8_outputFileTSV00
 set val("v_germline"), file("V_novel_germline.fasta") optional true  into g_8_germlineFastaFile1_g_128

script:
chain = params.Undocumented_Alleles.chain
num_threads = params.Undocumented_Alleles.num_threads
germline_min = params.Undocumented_Alleles.germline_min
min_seqs = params.Undocumented_Alleles.min_seqs
auto_mutrange = params.Undocumented_Alleles.auto_mutrange
mut_range = params.Undocumented_Alleles.mut_range
pos_range = params.Undocumented_Alleles.pos_range
y_intercept = params.Undocumented_Alleles.y_intercept
alpha = params.Undocumented_Alleles.alpha
j_max = params.Undocumented_Alleles.j_max
min_frac = params.Undocumented_Alleles.min_frac


out_novel_file = airr_file.toString() - ".tsv" + "_novel-passed.tsv"

out_novel_germline = "V_novel_germline"

"""
#!/usr/bin/env Rscript

${cmd}

# libraries
suppressMessages(require(dplyr))

# functions

## check for repeated nucliotide in sequece. get the novel allele and the germline sequence.
Repeated_Read <- function(x, seq) {
  NT <- as.numeric(stringr::str_extract(x, "^[0-9]+"))#as.numeric(gsub('([0-9]+).*', '', x))
  SNP <- gsub('.*>', '', x)
  OR_SNP <- stringr::str_extract(x, "^[0-9]+([[:alpha:]]*)") %>%
          stringr::str_replace("^[0-9]+", "") #gsub('[0-9]+([[:alpha:]]*).*', '', x)
  seq <- c(substr(seq, (NT), (NT + 3)),
           substr(seq, (NT - 1), (NT + 2)),
           substr(seq, (NT - 2), (NT + 1)),
           substr(seq, (NT - 3), (NT)))
  PAT <- paste0(c(
    paste0(c(rep(SNP, 3), OR_SNP), collapse = ""),
    paste0(c(rep(SNP, 2), OR_SNP, SNP), collapse = ""),
    paste0(c(SNP, OR_SNP, rep(SNP, 2)), collapse = ""),
    paste0(c(OR_SNP, rep(SNP, 3)), collapse = "")
  ), collapse = '|')
  if (any(grepl(PAT, seq)))
    return(gsub(SNP, 'X', gsub(OR_SNP, 'z', seq[grepl(PAT, seq)])))
  else
    return(NA)
}

# read data and germline
data <- data.table::fread('${airr_file}', stringsAsFactors = F, data.table = F)
vgerm <- tigger::readIgFasta('${v_germline_file}')

# transfer groovy param to rsctipt
num_threads = as.numeric(${num_threads})
germline_min = as.numeric(${germline_min})
min_seqs = as.numeric(${min_seqs})
y_intercept = as.numeric(${y_intercept})
alpha = as.numeric(${alpha})
j_max = as.numeric(${j_max})
min_frac = as.numeric(${min_frac})
auto_mutrange = as.logical('${auto_mutrange}')
mut_range = as.numeric(unlist(strsplit('${mut_range}',":")))
mut_range = mut_range[1]:mut_range[2]
pos_range = as.numeric(unlist(strsplit('${pos_range}',":")))
pos_range = pos_range[1]:pos_range[2]


novel =  try(findNovelAlleles(
data = data,
germline_db = vgerm,
v_call = 'v_call',
j_call = 'j_call' ,
seq = 'sequence_alignment',
junction = 'junction',
junction_length = 'junction_length',
germline_min = germline_min,
min_seqs = min_seqs,
y_intercept = y_intercept,
alpha = alpha,
j_max = j_max,
min_frac = min_frac,
auto_mutrange = auto_mutrange,
mut_range = mut_range,
pos_range = pos_range,
nproc = num_threads
))
	
  
# select only the novel alleles
if (class(novel) != 'try-error') {

	if (nrow(novel) != 0) {
		novel <- tigger::selectNovel(novel)
		novel <- novel %>% dplyr::distinct(novel_imgt, .keep_all = TRUE) %>% 
		dplyr::filter(!is.na(novel_imgt), nt_substitutions!='') %>% 
		dplyr::mutate(gene = alakazam::getGene(germline_call, strip_d = F)) %>%
		dplyr::group_by(gene) %>% dplyr::top_n(n = 2, wt = novel_imgt_count)
	}
	
	## remove padded alleles
	print(novel)
	
	if (nrow(novel) != 0) {
		SNP_XXXX <- unlist(sapply(1:nrow(novel), function(i) {
		  subs <- strsplit(novel[['nt_substitutions']][i], ',')[[1]]
		  RR <-
		    unlist(sapply(subs,
		           Repeated_Read,
		           seq = novel[['germline_imgt']][i],
		           simplify = F))
		  RR <- RR[!is.na(RR)]
		  
		  length(RR) != 0
		}))
		
		novel <- novel[!SNP_XXXX, ]
		
		# remove duplicated novel alleles
		bool <- !duplicated(novel[['polymorphism_call']])
		novel <- novel[bool, ]
		
		# save novel output
		write.table(
		    novel,
		    file = '${out_novel_file}',
		    row.names = FALSE,
		    quote = FALSE,
		    sep = '\t'
		)
		
		# save germline
		novel_v_germline <- setNames(gsub('-', '.', novel[['novel_imgt']], fixed = T), novel[['polymorphism_call']])
		tigger::writeFasta(c(vgerm, novel_v_germline), paste0('${out_novel_germline}','.fasta'))
	}else{
		## write fake file
		file.copy(from = '${v_germline_file}', to = paste0('./','${out_novel_germline}','.fasta'))
		
		#file.create(paste0('${out_novel_germline}','.txt'))
		
	}
	
	
}else{
	file.copy(from = '${v_germline_file}', to = paste0('./','${out_novel_germline}','.fasta'))
	#file.create(paste0('${out_novel_germline}','.txt'))
}
"""


}

g_8_germlineFastaFile1_g_128= g_8_germlineFastaFile1_g_128.ifEmpty([""]) 


process change_names_fasta {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /changes.csv$/) "novel_changes/$filename"}
input:
 set val(name), file(v_ref) from g_8_germlineFastaFile1_g_128

output:
 set val(name), file("new_V_novel_germline*")  into g_128_germlineFastaFile0_g126_22, g_128_germlineFastaFile0_g126_12, g_128_germlineFastaFile0_g127_0, g_128_germlineFastaFile0_g127_1
 file "changes.csv" optional true  into g_128_outputFileCSV1_g_124


script:

readArray_v_ref = v_ref.toString().split(' ')[0]

if(readArray_v_ref.endsWith("fasta")){

"""
#!/usr/bin/env python3 

import pandas as pd
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio import SeqIO
from hashlib import sha256 


def fasta_to_dataframe(file_path):
    data = {'ID': [], 'Sequence': []}
    with open(file_path, 'r') as file:
        for record in SeqIO.parse(file, 'fasta'):
            data['ID'].append(record.id)
            data['Sequence'].append(str(record.seq))

        df = pd.DataFrame(data)
        return df


file_path = '${readArray_v_ref}'  # Replace with the actual path
df = fasta_to_dataframe(file_path)


for index, row in df.iterrows():   
  if len(row['ID']) > 50:
    print("hoo")
    print(row['ID'])
    row['ID'] = row['ID'].split('*')[0] + '*' + row['ID'].split('*')[1].split('_')[0] + '_' + sha256(row['Sequence'].encode('utf-8')).hexdigest()[-4:]


def dataframe_to_fasta(df, output_file, description_column='Description', default_description=''):
    records = []

    for index, row in df.iterrows():
        sequence_record = SeqRecord(Seq(row['Sequence']), id=row['ID'])

        # Use the description from the DataFrame if available, otherwise use the default
        description = row.get(description_column, default_description)
        sequence_record.description = description

        records.append(sequence_record)

    with open(output_file, 'w') as output_handle:
        SeqIO.write(records, output_handle, 'fasta')

def save_changes_to_csv(old_df, new_df, output_file):
    changes = []
    for index, (old_row, new_row) in enumerate(zip(old_df.itertuples(), new_df.itertuples()), 1):
        if old_row.ID != new_row.ID:
            changes.append({'Row': index, 'Old_ID': old_row.ID, 'New_ID': new_row.ID})
    
    changes_df = pd.DataFrame(changes)
    if not changes_df.empty:
        changes_df.to_csv(output_file, index=False)
        
output_file_path = 'new_V_novel_germline.fasta'

dataframe_to_fasta(df, output_file_path)


file_path = '${readArray_v_ref}'  # Replace with the actual path
old_df = fasta_to_dataframe(file_path)

output_csv_file = "changes.csv"
save_changes_to_csv(old_df, df, output_csv_file)

"""
} else{
	
"""
#!/usr/bin/env python3 
	

file_path = 'new_V_novel_germline.txt'

with open(file_path, 'w'):
    pass
    
"""    
}    
}


process Second_Alignment_V_MakeBlastDb {

input:
 set val(db_name), file(germlineFile) from g_128_germlineFastaFile0_g126_22

output:
 file "${db_name}"  into g126_22_germlineDb0_g126_9

script:

if(germlineFile.getName().endsWith("fasta")){
	"""
	sed -e '/^>/! s/[.]//g' ${germlineFile} > tmp_germline.fasta
	mkdir -m777 ${db_name}
	makeblastdb -parse_seqids -dbtype nucl -in tmp_germline.fasta -out ${db_name}/${db_name}
	"""
}else{
	"""
	echo something if off
	"""
}

}


process Second_Alignment_IgBlastn {

input:
 set val(name),file(fastaFile) from g_80_germlineFastaFile0_g126_9
 file db_v from g126_22_germlineDb0_g126_9
 file db_d from g126_16_germlineDb0_g126_9
 file db_j from g126_17_germlineDb0_g126_9
 file custom_internal_data from g_114_outputFileTxt0_g126_9

output:
 set val(name), file("${outfile}") optional true  into g126_9_igblastOut0_g126_12

script:
num_threads = params.Second_Alignment_IgBlastn.num_threads
ig_seqtype = params.Second_Alignment_IgBlastn.ig_seqtype
outfmt = params.Second_Alignment_IgBlastn.outfmt
num_alignments_V = params.Second_Alignment_IgBlastn.num_alignments_V
domain_system = params.Second_Alignment_IgBlastn.domain_system

randomString = org.apache.commons.lang.RandomStringUtils.random(9, true, true)
outname = name + "_" + randomString
outfile = (outfmt=="MakeDb") ? name+"_"+randomString+".out" : name+"_"+randomString+".tsv"
outfmt = (outfmt=="MakeDb") ? "'7 std qseq sseq btop'" : "19"

if(db_v.toString()!="" && db_d.toString()!="" && db_j.toString()!=""){
	"""
	export IGDATA=/usr/local/share/igblast
	
	igblastn -query ${fastaFile} \
		-germline_db_V ${db_v}/${db_v} \
		-germline_db_D ${db_d}/${db_d} \
		-germline_db_J ${db_j}/${db_j} \
		-num_alignments_V ${num_alignments_V} \
		-domain_system imgt \
		-auxiliary_data ${custom_internal_data} \
		-outfmt ${outfmt} \
		-num_threads ${num_threads} \
		-out ${outfile}
	"""
}else{
	"""
	"""
}

}


process Second_Alignment_MakeDb {

input:
 set val(name),file(fastaFile) from g_80_germlineFastaFile0_g126_12
 set val(name_igblast),file(igblastOut) from g126_9_igblastOut0_g126_12
 set val(name1), file(v_germline_file) from g_128_germlineFastaFile0_g126_12
 set val(name2), file(d_germline_file) from g_122_germlineFastaFile0_g126_12
 set val(name3), file(j_germline_file) from g_120_germlineFastaFile0_g126_12

output:
 set val(name_igblast),file("*_db-pass.tsv") optional true  into g126_12_outputFileTSV0_g127_0, g126_12_outputFileTSV0_g127_9
 set val("reference_set"), file("${reference_set}") optional true  into g126_12_germlineFastaFile1_g_124
 set val(name_igblast),file("*_db-fail.tsv") optional true  into g126_12_outputFileTSV22

script:

failed = params.Second_Alignment_MakeDb.failed
format = params.Second_Alignment_MakeDb.format
regions = params.Second_Alignment_MakeDb.regions
extended = params.Second_Alignment_MakeDb.extended
asisid = params.Second_Alignment_MakeDb.asisid
asiscalls = params.Second_Alignment_MakeDb.asiscalls
inferjunction = params.Second_Alignment_MakeDb.inferjunction
partial = params.Second_Alignment_MakeDb.partial
name_alignment = params.Second_Alignment_MakeDb.name_alignment

failed = (failed=="true") ? "--failed" : ""
format = (format=="changeo") ? "--format changeo" : ""
extended = (extended=="true") ? "--extended" : ""
regions = (regions=="rhesus-igl") ? "--regions rhesus-igl" : ""
asisid = (asisid=="true") ? "--asis-id" : ""
asiscalls = (asiscalls=="true") ? "--asis-calls" : ""
inferjunction = (inferjunction=="true") ? "--infer-junction" : ""
partial = (partial=="true") ? "--partial" : ""

reference_set = "reference_set_makedb_"+name_alignment+".fasta"

outname = name_igblast+'_'+name_alignment

if(igblastOut.getName().endsWith(".out")){
	"""
	
	cat ${v_germline_file} ${d_germline_file} ${j_germline_file} > ${reference_set}
	
	MakeDb.py igblast \
		-s ${fastaFile} \
		-i ${igblastOut} \
		-r ${v_germline_file} ${d_germline_file} ${j_germline_file} \
		--log MD_${name}.log \
		--outname ${outname}\
		${extended} \
		${failed} \
		${format} \
		${regions} \
		${asisid} \
		${asiscalls} \
		${inferjunction} \
		${partial}
	"""
}else{
	"""
	
	"""
}

}

g_128_germlineFastaFile0_g127_0= g_128_germlineFastaFile0_g127_0.ifEmpty([""]) 
g_122_germlineFastaFile0_g127_0= g_122_germlineFastaFile0_g127_0.ifEmpty([""]) 
g_120_germlineFastaFile0_g127_0= g_120_germlineFastaFile0_g127_0.ifEmpty([""]) 


process Clone_AIRRseq_First_CreateGermlines {

input:
 set val(name),file(airrFile) from g126_12_outputFileTSV0_g127_0
 set val(name1), file(v_germline_file) from g_128_germlineFastaFile0_g127_0
 set val(name2), file(d_germline_file) from g_122_germlineFastaFile0_g127_0
 set val(name3), file(j_germline_file) from g_120_germlineFastaFile0_g127_0

output:
 set val(name),file("*_germ-pass.tsv")  into g127_0_outputFileTSV0_g127_2

script:
failed = params.Clone_AIRRseq_First_CreateGermlines.failed
format = params.Clone_AIRRseq_First_CreateGermlines.format
g = params.Clone_AIRRseq_First_CreateGermlines.g
cloned = params.Clone_AIRRseq_First_CreateGermlines.cloned
seq_field = params.Clone_AIRRseq_First_CreateGermlines.seq_field
v_field = params.Clone_AIRRseq_First_CreateGermlines.v_field
d_field = params.Clone_AIRRseq_First_CreateGermlines.d_field
j_field = params.Clone_AIRRseq_First_CreateGermlines.j_field
clone_field = params.Clone_AIRRseq_First_CreateGermlines.clone_field


failed = (failed=="true") ? "--failed" : ""
format = (format=="airr") ? "": "--format changeo"
g = "-g ${g}"
cloned = (cloned=="false") ? "" : "--cloned"

v_field = (v_field=="") ? "" : "--vf ${v_field}"
d_field = (d_field=="") ? "" : "--df ${d_field}"
j_field = (j_field=="") ? "" : "--jf ${j_field}"
seq_field = (seq_field=="") ? "" : "--sf ${seq_field}"

"""
CreateGermlines.py \
	-d ${airrFile} \
	-r ${v_germline_file} ${d_germline_file} ${j_germline_file} \
	${failed} \
	${format} \
	${g} \
	${cloned} \
	${v_field} \
	${d_field} \
	${j_field} \
	${seq_field} \
	${clone_field} \
	--log CG_${name}.log 

"""



}


process Clone_AIRRseq_DefineClones {

input:
 set val(name),file(airrFile) from g127_0_outputFileTSV0_g127_2

output:
 set val(name),file("*_clone-pass.tsv")  into g127_2_outputFileTSV0_g127_1

script:
failed = params.Clone_AIRRseq_DefineClones.failed
format = params.Clone_AIRRseq_DefineClones.format
seq_field = params.Clone_AIRRseq_DefineClones.seq_field
v_field = params.Clone_AIRRseq_DefineClones.v_field
d_field = params.Clone_AIRRseq_DefineClones.d_field
j_field = params.Clone_AIRRseq_DefineClones.j_field
group_fields = params.Clone_AIRRseq_DefineClones.group_fields

mode = params.Clone_AIRRseq_DefineClones.mode
dist = params.Clone_AIRRseq_DefineClones.dist
norm = params.Clone_AIRRseq_DefineClones.norm
act = params.Clone_AIRRseq_DefineClones.act
model = params.Clone_AIRRseq_DefineClones.model
sym = params.Clone_AIRRseq_DefineClones.sym
link = params.Clone_AIRRseq_DefineClones.link
maxmiss = params.Clone_AIRRseq_DefineClones.maxmiss

failed = (failed=="true") ? "--failed" : ""
format = (format=="airr") ? "--format airr": "--format changeo"
group_fields = (group_fields=="") ? "" : "--gf ${group_fields}"
v_field = (v_field=="") ? "" : "--vf ${v_field}"
d_field = (d_field=="") ? "" : "--df ${d_field}"
j_field = (j_field=="") ? "" : "--jf ${j_field}"
seq_field = (seq_field=="") ? "" : "--sf ${seq_field}"


mode = (mode=="gene") ? "" : "--mode ${mode}"
norm = (norm=="len") ? "" : "--norn ${norm}"
act = (act=="set") ? "" : "--act ${act}"
model = (model=="ham") ? "" : "--model ${model}"
sym = (sym=="avg") ? "" : "--sym ${sym}"
link = (link=="single") ? "" : " --link ${link}"
    
	
"""
DefineClones.py -d ${airrFile} \
	${failed} \
	${format} \
	${v_field} \
	${d_field} \
	${j_field} \
	${seq_field} \
	${group_fields} \
	${mode} \
	${act} \
	${model} \
	--dist ${dist} \
	${norm} \
	${sym} \
	${link} \
	--maxmiss ${maxmiss} \
	--log DF_.log  
"""



}

g_128_germlineFastaFile0_g127_1= g_128_germlineFastaFile0_g127_1.ifEmpty([""]) 
g_122_germlineFastaFile0_g127_1= g_122_germlineFastaFile0_g127_1.ifEmpty([""]) 
g_120_germlineFastaFile0_g127_1= g_120_germlineFastaFile0_g127_1.ifEmpty([""]) 


process Clone_AIRRseq_Second_CreateGermlines {

input:
 set val(name),file(airrFile) from g127_2_outputFileTSV0_g127_1
 set val(name1), file(v_germline_file) from g_128_germlineFastaFile0_g127_1
 set val(name2), file(d_germline_file) from g_122_germlineFastaFile0_g127_1
 set val(name3), file(j_germline_file) from g_120_germlineFastaFile0_g127_1

output:
 set val(name),file("*_germ-pass.tsv")  into g127_1_outputFileTSV0_g127_9

script:
failed = params.Clone_AIRRseq_Second_CreateGermlines.failed
format = params.Clone_AIRRseq_Second_CreateGermlines.format
g = params.Clone_AIRRseq_Second_CreateGermlines.g
cloned = params.Clone_AIRRseq_Second_CreateGermlines.cloned
seq_field = params.Clone_AIRRseq_Second_CreateGermlines.seq_field
v_field = params.Clone_AIRRseq_Second_CreateGermlines.v_field
d_field = params.Clone_AIRRseq_Second_CreateGermlines.d_field
j_field = params.Clone_AIRRseq_Second_CreateGermlines.j_field
clone_field = params.Clone_AIRRseq_Second_CreateGermlines.clone_field


failed = (failed=="true") ? "--failed" : ""
format = (format=="airr") ? "": "--format changeo"
g = "-g ${g}"
cloned = (cloned=="false") ? "" : "--cloned"

v_field = (v_field=="") ? "" : "--vf ${v_field}"
d_field = (d_field=="") ? "" : "--df ${d_field}"
j_field = (j_field=="") ? "" : "--jf ${j_field}"
seq_field = (seq_field=="") ? "" : "--sf ${seq_field}"

"""
CreateGermlines.py \
	-d ${airrFile} \
	-r ${v_germline_file} ${d_germline_file} ${j_germline_file} \
	${failed} \
	${format} \
	${g} \
	${cloned} \
	${v_field} \
	${d_field} \
	${j_field} \
	${seq_field} \
	${clone_field} \
	--log CG_${name}.log 

"""



}


process Clone_AIRRseq_single_clone_representative {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_clone_rep-passed.tsv.*$/) "clones/$filename"}
input:
 set val(name),file(airrFile) from g127_1_outputFileTSV0_g127_9
 set val(name1),file(source_airrFile) from g126_12_outputFileTSV0_g127_9

output:
 set val(outname),file("*_clone_rep-passed.tsv*")  into g127_9_outputFileTSV0_g_124
 file "*.pdf" optional true  into g127_9_outputFilePdf11
 set val(name), file("*txt")  into g127_9_logFile22
 file "*png"  into g127_9_outputFile33

script:
outname = airrFile.toString() - '.tsv' +"_clone_rep-passed"
outfile = outname + ".tsv"

"""
#!/usr/bin/env Rscript

## functions
# find the different position between sequences

src <- 
"#include <Rcpp.h>
using namespace Rcpp;
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <unordered_set>

// [[Rcpp::export]]

int allele_diff(std::vector<std::string> germs) {
    std::vector<std::vector<char>> germs_m;
    for (const std::string& germ : germs) {
        germs_m.push_back(std::vector<char>(germ.begin(), germ.end()));
    }

    int max_length = 0;
    for (const auto& germ : germs_m) {
        max_length = std::max(max_length, static_cast<int>(germ.size()));
    }

    for (auto& germ : germs_m) {
        germ.resize(max_length, '.'); // Pad with '.' to make all germs equal length
    }

    auto setdiff_mat = [](const std::vector<char>& x) -> int {
        std::unordered_set<char> unique_chars(x.begin(), x.end());
        std::unordered_set<char> filter_chars = { '.', 'N', '-' };
        int diff_count = 0;
        for (const char& c : unique_chars) {
            if (filter_chars.find(c) == filter_chars.end()) {
                diff_count++;
            }
        }
        return diff_count;
    };

    std::vector<int> idx;
    for (int i = 0; i < max_length; i++) {
        std::vector<char> column_chars;
        for (const auto& germ : germs_m) {
            column_chars.push_back(germ[i]);
        }
        int diff_count = setdiff_mat(column_chars);
        if (diff_count > 1) {
            idx.push_back(i);
        }
    }

    return idx.size();
}"

## libraries
require(dplyr)
library(Rcpp)
library(ggplot2)
sourceCpp(code = src)

data <- readr::read_tsv("${airrFile}")

source_data <- readr::read_tsv("${source_airrFile}")

# calculating mutation between IMGT sequence and the germline sequence, selecting a single sequence to each clone with the fewest mutations
data[["mut"]] <- sapply(1:nrow(data),function(j){
	x <- c(data[['sequence_alignment']][j], data[['germline_alignment_d_mask']][j])
	allele_diff(x)
})
# filter to the fewest mutations
data <- data %>% dplyr::group_by(clone_id) %>% 
			dplyr::mutate(clone_size = n())

data_report <- data %>% dplyr::rowwise() %>%
			dplyr::mutate(v_gene = alakazam::getGene(v_call, strip_d = FALSE)) %>%
			dplyr::group_by(v_gene, clone_id, clone_size) %>% dplyr::slice(1)

print(head(data_report))

p1 <- ggplot(data_report, aes(clone_size)) +
	geom_histogram(bins = 100) +
	facet_wrap(.~v_gene, ncol = 4)

ggsave("clone_distribution_by_v_call.pdf", p1, width = 12, height = 25)

max_clone_sizes <- data_report %>%
  group_by(v_gene) %>%
  summarize(max_clone_size = max(clone_size))

# Create a list of plots
plots <- lapply(seq(nrow(max_clone_sizes)), function(i) {
  ggplot(data_report %>% filter(v_gene == max_clone_sizes[i,"v_gene"]), aes(clone_size)) +
    geom_histogram(bins = max_clone_sizes[i,"max_clone_size"]) +
    ggtitle(paste("v_gene =", max_clone_sizes[i,"v_gene"]))
})

# Combine the list of plots into a single plot
library(gridExtra)
final_plot <- do.call(grid.arrange, plots)


ggsave("clone_distribution_by_v_call.png", final_plot, width = 30, height = 40)



data <- data %>% dplyr::group_by(clone_id) %>% dplyr::slice(which.min(mut))
cat(paste0('Note ', nrow(data),' sequences after selecting single representative'))
readr::write_tsv(data, file = "${outfile}")

x <- nrow(source_data)-nrow(data)

lines <- c(
    paste("START>", "After picking clonal representatives"),
    paste("PASS>", nrow(data)),
    paste("FAIL>", nrow(source_data)-nrow(data)),
    paste("END>", "After picking clonal representatives"),
    "",
    ""
  )


file_path <- paste("${outname}","output.txt", sep="-")

cat(lines, sep = "\n", file = file_path, append = TRUE)

"""
}

g_122_outputFileCSV1_g_124= g_122_outputFileCSV1_g_124.ifEmpty([""]) 
g_120_outputFileCSV1_g_124= g_120_outputFileCSV1_g_124.ifEmpty([""]) 
g_128_outputFileCSV1_g_124= g_128_outputFileCSV1_g_124.ifEmpty([""]) 


process changes_names_for_piglet {

publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_change_name.tsv$/) "pre_genotype/$filename"}
publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_to_piglet.tsv$/) "pre_genotype/$filename"}
publishDir params.outdir, mode: 'copy', saveAs: {filename -> if (filename =~ /.*_change_name_reference.tsv$/) "pre_genotype/$filename"}
input:
 set val(name),file(airrFile) from g127_9_outputFileTSV0_g_124
 file v_change from g_116_csvFile1_g_124
 file d_change from g_122_outputFileCSV1_g_124
 file j_change from g_120_outputFileCSV1_g_124
 file v_change_novel from g_128_outputFileCSV1_g_124
 set val(name2),file(reference) from g126_12_germlineFastaFile1_g_124

output:
 set val(name),file("*_change_name.tsv")  into g_124_outputFileTSV00
 set val(name),file("*_to_piglet.tsv")  into g_124_outputFileTSV11
 set val(name),file("*_change_name_reference.tsv")  into g_124_outputFileTSV22

script:
chain = params.changes_names_for_piglet.chain

outname = airrFile.toString() - '.tsv' +"_change_name"
outname_selected = airrFile.toString() - '.tsv' +"_to_piglet"

"""
#!/usr/bin/env Rscript

library(data.table)
library(alakazam)
library(ggplot2)
library(dplyr)
library(parallel)
library(pbapply)
library(stringr)

sample <- strsplit(basename("${airrFile}"), "[.]")[[1]][1]

select_columns <- if ("${chain}" == "IGH") c("sequence_id", "v_call", "d_call", "j_call") else c("sequence_id", "v_call", "j_call")
data <- data.table::fread("${airrFile}", data.table = F)

# Load V change file
change_file <- "v_changes.csv"
changes <- read.csv(change_file, header = FALSE, col.names = c("row", "old_id", "new_id"))

# Convert to data.table
setDT(data)

# Add new columns to data
data[, `:=`(
  v_call_changed = v_call,
  d_call_changed = d_call,
  j_call_changed = j_call
)]

reference = tigger::readIgFasta("${reference}")
reference = data.table(allele = names(reference), sequence = reference, allele_changed = names(reference))


if (file.exists(change_file)) {
	# Apply changes to v_call
	for (change in 1:nrow(changes)) {
	  old_id <- changes[change, "old_id"]
	  new_id <- changes[change, "new_id"]
	  data[str_detect(v_call, fixed(new_id)), v_call_changed := old_id]
	  reference[str_detect(allele, fixed(new_id)), allele_changed := old_id]
	}
	data[["v_call"]] <- data[["v_call_changed"]]
} else {
  message("Change file does not exist. No changes applied to v_call.")
}

if (file.exists("changes.csv")) {
	data[, `:=`(
	  v_call_changed = v_call,
	  d_call_changed = d_call,
	  j_call_changed = j_call
	)]
	# Apply changes to v_call
	change_file <- "changes.csv"
    changes <- read.csv(change_file, header = FALSE, col.names = c("row", "old_id", "new_id"))
	for (change in 1:nrow(changes)) {
	  old_id <- changes[change, "old_id"]
	  new_id <- changes[change, "new_id"]
	  data[str_detect(v_call, fixed(new_id)), v_call_changed := old_id]
	  reference[str_detect(allele, fixed(new_id)), allele_changed := old_id]
	}
	data[["v_call"]] <- data[["v_call_changed"]]
} else {
  message("Change file does not exist. No changes applied to v_call.")
}

# Apply changes to d_call if chain is IGH
if ("${chain}" == "IGH") {
  change_file <- "d_changes.csv"
  if (file.exists(change_file)) {
	  changes <- read.csv(change_file, header = FALSE, col.names = c("row", "old_id", "new_id"))
	  for (change in 1:nrow(changes)) {
	    old_id <- changes[change, "old_id"]
	    new_id <- changes[change, "new_id"]
	    data[, d_call_changed := str_replace_all(d_call_changed, fixed(new_id), old_id)]
	    reference[str_detect(allele, fixed(new_id)), allele_changed := old_id]
	  }
	  data[["d_call"]] <- data[["d_call_changed"]]
	} else {
	  message("Change file does not exist. No changes applied to d_call.")
	}
}

change_file <- "j_changes.csv"
# Apply changes to j_call
if (file.exists(change_file)) {
  changes <- read.csv(change_file, header = FALSE, col.names = c("row", "old_id", "new_id"))
  for (change in 1:nrow(changes)) {
    old_id <- changes[change, "old_id"]
    new_id <- changes[change, "new_id"]
    data[, j_call_changed := str_replace_all(j_call_changed, fixed(new_id), old_id)]
    reference[str_detect(allele, fixed(new_id)), allele_changed := old_id]
  }
  data[["j_call"]] <- data[["j_call_changed"]]
} else {
  message("Change file does not exist. No changes applied to j_call.")
}

# Write the full output file
write.table(data, sep = "\t", file = paste0("${outname}", ".tsv"), row.names = FALSE)

# Write the selected columns output
select_columns <- if ("${chain}" == "IGH") c("sequence_id", "v_call", "d_call", "j_call") else c("sequence_id", "v_call", "j_call")
setDT(data)
data_selected <- data[, .SD, .SDcols = select_columns]
write.table(data_selected, sep = "\t", file = paste0("${outname_selected}", ".tsv"), row.names = FALSE)

# write the reference
write.table(reference, sep = "\t", file = paste0("${outname}_reference", ".tsv"), row.names = FALSE)
"""

}


workflow.onComplete {
println "##Pipeline execution summary##"
println "---------------------------"
println "##Completed at: $workflow.complete"
println "##Duration: ${workflow.duration}"
println "##Success: ${workflow.success ? 'OK' : 'failed' }"
println "##Exit status: ${workflow.exitStatus}"
}
