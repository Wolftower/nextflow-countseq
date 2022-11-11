#!/usr/bin/env nextflow

process countNumSeq {
  input: 
    path fastaFile
  output:
    stdout
  script:
    """
    grep '>' $fastaFile | wc -l
    """
}

workflow {
  fastaChannel = Channel.fromPath('data/bacterial_dna.fasta')
  outChannel = countNumSeq(fastaChannel)
  outChannel.view { "Number of sequences: $it" }
}

