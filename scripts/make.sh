cd out
BIGS=$(grep "big" * | awk '{print $4}')
MEMCACHEDS=$(grep "big" * | awk '{print $6}')
FILE_NAMES=$(grep -L .txt * )

mv ${FILE_NAMES} big-${BIGS}_mem-${MEMCACHEDS}.txt
