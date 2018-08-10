#!/bin/bash

# http://wiki.bash-hackers.org/howto/getopts_tutorial
while getopts :c:t:d:f:a:s:p:m: opt; do
  case $opt in
    c)
	  start_call=$OPTARG;;
	t)
	  task_id=$OPTARG;;
	d)
	  datafile=$OPTARG;;
	f)
	  fold_n=$OPTARG;;
	a)
	  apikey=$OPTARG;;
	s)
	  time_s=$OPTARG;;
	p)
	  n_cores=$OPTARG;;
	m)
	  metric=$OPTARG;;
	\?)
	  echo "Invalid option: -$OPTARG";;
  esac	  
done

if [ -z ${start_call+x} ]; then echo "start_call is unset"; exit; fi
if [ -z ${fold_n+x} ]; then echo "fold_n is unset"; exit; fi
if [ -z ${apikey+x} ]; then echo "apikey is unset"; exit; fi
if [ -z ${time_s+x} ]; then echo "time_s is unset"; exit; fi
if [ -z ${n_cores+x} ]; then echo "n_cores is unset"; exit; fi
if [ -z ${metric+x} ]; then echo "metric is unset"; exit; fi
if [ -z ${task_id+x} ] && [ -z ${datafile+x} ]; then echo "Either task or datafile needs to be set"; exit; fi

/venvs/setup/bin/python3 ./common/load_data.py $task_id $fold_n $apikey ./common/train.arff ./common/test.arff

cd automl
$start_call $time_s $n_cores $metric
cd ..

/venvs/setup/bin/python3 ./common/evaluate.py ./common/test.arff ./common/predictions.csv $metric
