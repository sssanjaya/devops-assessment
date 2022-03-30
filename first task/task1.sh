#!/bin/bash

# TO-DO
# - /opt directory
# - find directory which contains files called .prune-enable
# - in those directories delete file named crash.dump
# - for any file with suffix ".log" > mb, replace file with a file containing the last 20,000 lines

# working directory is /opt
if [ "$PWD" != "/opt" ]; then
    cd /opt
    printf " working directory changed to $PWD ! \n"
fi

# for any file with suffix ".log" > mb, replace file with a file containing the last 20,000 lines
replacelogfile(){
    logfiles=$(find . -type f -name "*.log" -size +1M)
    for logfile in $logfiles; do
            echo $logfile
            printf "$logfile is greater than 1mb size ! \n"
            tail -n 20000 $logfile > logtemp.tmp
            mv logtemp.tmp $logfile
            wc -l $logfile
    done
}

# Search all directory with .prune-enable file
search_directory=$(find . -name ".prune-enable" -exec dirname {} \;)
printf "File .prune-enable is found on following directories: \n $search_directory \n"

# In search_directory delete file named crash.dump
for item in $search_directory;
    do
        cd $item
        if [[ $(find . -name ".prune-enable") ]]; then
            find . -type f -name "crash.dump" -exec rm '{}' \;
            replacelogfile $item
        fi
        cd /opt
done

