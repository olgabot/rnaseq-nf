
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
    # Show whether you're in a docker container
    # From: http://youdidwhatwithtsql.com/how-to-tell-if-youre-in-a-docker-container/2466/
    grep :/docker /proc/self/cgroup | wc -l

   
    salmon index --threads $task.cpus -t $transcriptome -i index
    """
}
