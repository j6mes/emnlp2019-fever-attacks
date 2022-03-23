export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        rm $WORKDIR
        mkdir -pv $WORKDIR
        cp $BASEDIR/$2 $WORKDIR
        docker run --rm -it --runtime=nvidia -v $WORKDIR:/work $1 run.sh $2 predictions.$1.$2
        cp $WORKDIR/predictions.$1.$2 $BASEDIR/predictions
}

#run_model fever-unc rules.999.jsonl
#run_model fever-unc sampled.999.jsonl
#run_model fever-unc sears.fever.999.jsonl
#run_model fever-unc sears.sentiment.999.jsonl

#run_model fever-athene rules.999.jsonl
run_model fever-athene sampled.999.jsonl
run_model fever-athene sears.fever.999.jsonl
run_model fever-athene sears.sentiment.999.jsonl

run_model fever-ucl rules.999.jsonl
run_model fever-ucl sampled.999.jsonl
run_model fever-ucl sears.fever.999.jsonl
run_model fever-ucl sears.sentiment.999.jsonl

run_model fever-papelo rules.999.jsonl
run_model fever-papelo sampled.999.jsonl
run_model fever-papelo sears.fever.999.jsonl
run_model fever-papelo sears.sentiment.999.jsonl

