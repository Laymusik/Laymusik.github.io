#!/usr/bin/env bash
failed=0

for url in "http://localhost/" "http://localhost/backend/"; do
    if code=$(curl --silent --show-error --output /dev/null \
        --write-out '%{http_code}' --max-time 5 "$url"); then
        if [[ "$code" == "200" ]]; then
            echo "OK   $url HTTP=$code"
        else
            echo "FAIL $url HTTP=$code"
            failed=1
        fi
    else
        echo "FAIL $url connection error or timeout"
        failed=1
    fi
done

exit "$failed"