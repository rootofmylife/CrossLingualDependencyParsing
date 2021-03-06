#!/usr/bin/env bash

#
function run_lang () {

echo "======================"
echo "Running with lang = $1"

cur_lang=$1

CUDA_VISIBLE_DEVICES=7 python ../src/examples/analyze.py --parser biaffine --ordered --gpu \
--punctuation 'PUNCT' 'SYM' --out_filename analyzer.$cur_lang.out --model_name 'network.pt' \
--test "../data2.2/${cur_lang}_test.conllu" --model_path "./model/final_gtrans.sh_1/" --extra_embed "../data2.2/wiki.multi.${cur_lang}.vec" \
--decode proj --constraints_method PR --constraint_file "WALS_extra.pkl" --ratio_file "WALS" --mt_log "./log/${cur_lang}.log" \
--summary_log 'summary.log' --gamma 1

}

for lang in pl sv de sl no sk
do
    run_lang $lang;
done
