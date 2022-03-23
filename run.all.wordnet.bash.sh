export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        docker run --rm -it --runtime=nvidia -v $WORKDIR:/work fever-papelo 
}

run_all () {
#run_model fever-unc $1
#run_model fever-athene $1
#run_model fever-ucl $1
run_model fever-papelo $1
#run_model fever-baselines-all $1
#run_model fever-baseline-oracle-all $1
}

#run_all wordnet.fever.999.jsonl
run_all wordnet2.fever.999.jsonl
