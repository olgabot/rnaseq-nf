
process INDEX {
    tag "$transcriptome.simpleName"

    input:
    path transcriptome 

    output:
    path 'index' 

    script:
    """
    which -a python
    which -a aws
    which -a salmon
    python --version
    salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
