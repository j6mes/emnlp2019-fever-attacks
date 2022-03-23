#!/usr/bin/env bash

export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        rm $WORKDIR
        mkdir -pv $WORKDIR
        cp $BASEDIR/$2 $WORKDIR
        docker run --rm -it --runtime=nvidia -v $WORKDIR:/work $1 run.sh $2 predictions.$1.$2
        cp $WORKDIR/predictions.$1.$2 $BASEDIR/predictions
}

run_model fever-baseline-all rules.999.jsonl
run_model fever-baseline-all sampled.999.jsonl
run_model fever-baseline-all sears.fever.999.jsonl
run_model fever-baseline-all sears.sentiment.999.jsonl

