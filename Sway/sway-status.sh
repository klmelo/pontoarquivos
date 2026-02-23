#!/bin/bash

TEMP="--"
COUNTER=0

while true; do

    if [ $COUNTER -eq 0 ]; then

        if command -v sensors &> /dev/null; then

            RAW_TEMP=$(sensors | grep -m 1 -E 'Tctl|Tdie|Package|temp1|Core 0' | awk '{print $2}' | tr -d '+°C' | awk -F. '{print $1}')
            
            if [ ! -z "$RAW_TEMP" ]; then
                TEMP="$RAW_TEMP"
            fi
        fi
        COUNTER=5
    fi

    # Hora e data
    time=$(date '+%A, %d/%m/%Y; %H:%M')

    echo "CPU: ${TEMP}°C | $time"

    COUNTER=$((COUNTER - 1))
    sleep 0.2
done
