#!/usr/bin/env bash

export BASEDIR=/local/scratch/jt719/fever2-baseline

run_model () {
        export WORKDIR=/tmp/$1
        rm $WORKDIR
        mkdir -pv $WORKDIR
        cp $BASEDIR/$2 $WORKDIR
        docker run --rm -it -e --runtime=nvidia -v $WORKDIR:/work $1 run.sh $2 predictions.$1.$2
        cp $WORKDIR/predictions.$1.$2 $BASEDIR/predictions
}

run_model fever-baseline-all rules.before.jsonl
run_model fever-baseline-all rules.jsonl

