export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        rm $WORKDIR
        mkdir -pv $WORKDIR
        cp $BASEDIR/$2 $WORKDIR
        docker run --rm -it --runtime=nvidia -v $WORKDIR:/work $1 run.sh $2 predictions.$1.$2
        cp $WORKDIR/predictions.$1.$2 $BASEDIR/predictions
}

run_all () {
run_model fever-unc $1
run_model fever-athene $1
run_model fever-ucl $1
run_model fever-papelo $1
run_model fever-baseline-all $1
run_model fever-baseline-oracle-all $1
}

run_all paper_test.jsonl
