export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        rm $WORKDIR
        mkdir -pv $WORKDIR
        cp $BASEDIR/$2 $WORKDIR
        docker run --rm -it --runtime=nvidia -v $WORKDIR:/work $1 run.sh $2 predictions.$1.$2
        cp $WORKDIR/predictions.$1.$2 $BASEDIR/predictions
}

run_model fever-unc rules.jsonl
#run_model fever-unc rules.before.jsonl

run_model fever-athene rules.jsonl
#run_model fever-athene rules.before.jsonl

#run_model fever-ucl rules.jsonl
#run_model fever-ucl rules.before.jsonl

#run_model fever-papelo rules.jsonl
#run_model fever-papelo rules.before.jsonl

