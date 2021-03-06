#!/bin/sh
for entry in [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].log; do
       begin="$(echo $entry | cut -c1-7)"
       end=".log"
       new_file=$begin$end
IFS=''
while read line
do
 test="${entry%.*}"
    if [ "$#" -ne 0 ]; then
        NAME=${test}$1${line}
        else
        NAME=${test}" "${line}
    fi
    echo $NAME >> ${new_file}
 done < "$entry"
done
