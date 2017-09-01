NEW_NAMES=`grep big *`
FILE_NAMES=`ls`
i=0
for name in $NEW_NAMES; do
    mv ${FILE_NAMES[i]} $name
    i=$((i+1))
done
