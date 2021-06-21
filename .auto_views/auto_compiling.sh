#!/bin/bash

VAR_AVAILABLE_NAMES=( \
    "xxx" \
    )


function contains() {
    local n=$#
    local value=${!n}
    for ((i=1;i < $#;i++)) {
        if [ "${!i}" == "${value}" ]; then
            echo "y"
            return 0
        fi
    }
    echo "n"
    return 1
}

main()
{
    echo "Prepare compiling ("$1")"

    if [ -z "$1" ]; then
        echo "Invalid input !"
        return
    fi

    VAR_PRODUCT_NAME=$1

    FIX_DIR=f
    if [ -d "$FIX_DIR"  ]; then
        IS_FIX_REPOSITORY=1
    else
        IS_FIX_REPOSITORY=0
    fi

    if [ $1 = "system" ]; then
        if [ $IS_FIX_REPOSITORY -eq 0 ]; then
            VAR_PRODUCT_NAME=x
            echo "System compiling..."
        else
            echo "System compiling error !"
            return
        fi
    else
        if [ $(contains "${VAR_AVAILABLE_NAMES[@]}" "$VAR_PRODUCT_NAME") == "y" ]; then
            if [ $IS_FIX_REPOSITORY -eq 1 ]; then
                echo "Fix compiling..."
            else
                echo "Fix compiling error !"
                return
            fi
        else
            echo "Invalid product name !"
            return
        fi

        # second parameter is only for copy
        if [ $2 ]; then
            if [ $2 = "fix" ]; then
                echo "Copying ..."
                export WORKAROUND=true ;
            else
                echo "parameter error !"
                return
            fi
        else
            if [ "$WORKAROUND" != true ]; then
                echo "Must do ..."
                return
            fi
        fi
    fi

    echo "Start compiling ("$VAR_PRODUCT_NAME")"

    # do-compiling ...
}

main $1 $2

