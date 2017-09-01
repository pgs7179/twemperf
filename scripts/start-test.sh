PASSWARD=0416novel
SERVER=pgs7179@10.150.4.28
PASSWARD1=304caslab!
SERVER1=caslab@10.150.4.229
sshpass -p $PASSWARD1 ssh -o StrictHostKeyChecking=no $SERVER1 "/home/caslab/pgs/twemperf/scripts/./multi-client.sh" | ./multi-client.sh | sshpass -p $PASSWARD ssh -o StrictHostKeyChecking=no $SERVER "/home/pgs7179/BigDataBench_DCA_1/WorkLoad/Wordcount/./start.sh"

