PIDS=$(ps -eaf | grep mcperf | awk '{print $2}')
for pid in $PIDS;do
    kill $pid
done
