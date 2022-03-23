move_breaker() {
    export breaker=$1
    export model=$2
    mkdir -pv system_predictions/$breaker/
    cp predictions/predictions.$model.$breaker.999.jsonl system_predictions/$breaker/$model.jsonl
}


move_all_model() {
    export model=$1
    move_breaker rules $model
    move_breaker wordnet.fever $model
    move_breaker wordnet2.fever $model
    move_breaker sears.sentiment $model
    move_breaker sears.fever $model
    move_breaker sampled $model
}

move_all_model fever-unc
move_all_model fever-ucl
move_all_model fever-athene
move_all_model fever-papelo
