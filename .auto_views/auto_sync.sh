#!/bin/bash

do_sync()
{
    if [ $1 = "a" ]; then
        repo sync -c --no-tags -j${JOBS} \
            xxx \
    else
        if [ $1 = "b" ]; then
            repo sync -c --no-tags -j${JOBS} \
                yyy \
        else
            echo "Unknown sync ..."
        fi
    fi
}

init()
{
    if [[ $2 =~ -j[1-9][0-9]{0,1}$ ]]; then
        JOBS=${2#*j} #-j99->99
    else
        JOBS=8 #default jobs
    fi
    echo "jobs =" $JOBS
}

main()
{
    init $@
    do_sync $@
}

main $@
