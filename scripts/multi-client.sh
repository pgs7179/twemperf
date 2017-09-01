#!/bin/bash

MCPERF=mcperf

CLIENTS=8

LOG=mcperf.log

HOST=10.150.4.28
PORT=11211

NUM_CONNS=4
CONN_RATE=100

NUM_CALLS=50000
CALL_RATE=0 #`expr 5342 / 4 \* 1`

DATA_SIZE="u1024,16384"
NOW=$(date +"%Y-%m-%d-%H-%M")
METHOD=( "set" "get" "gets" "delete" "add" "incr" "decr" "replace" "append" "prepend")

for i in `seq $CLIENTS`
do
    printf "Cleaning up existing log file at %s\n" $LOG.$i
    #rm -f $LOG.$i-$NOW
    printf "starting client %s\n" $i ${METHOD[$i-1]} 
    $MCPERF --server=$HOST --port=$PORT --client=$i/$CLIENTS --num-conns=$NUM_CONNS --conn-rate=$CONN_RATE --num-calls=$NUM_CALLS --call-rate=$CALL_RATE -z $DATA_SIZE --method=${METHOD[$i-1]} >> $LOG.$i-$NOW 2>&1 &
done


printf "Waiting for all clients to finish...."
wait
printf "done.\n"
grep -n -i "time" mcperf.* | grep Resp > out/$NOW.txt
rm mcperf.*


PASSWARD=0416novel
SERVER=pgs7179@10.150.4.28
PASSWARD1=304caslab!
SERVER1=caslab@10.150.4.229

sshpass -p $PASSWARD ssh -o StrictHostKeyChecking=no $SERVER "/home/pgs7179/BigDataBench_DCA_1/WorkLoad/Wordcount/./kill_job.sh"
sshpass -p $PASSWARD1 ssh -o StrictHostKeyChecking=no $SERVER1 "/home/caslab/pgs/twemperf/scripts/./kill_mcperf.sh"
