#!/bin/bash

ls ~/script-env | grep -vP '(sh|md|log|crontab)$' | grep -vP '^[0-9]{1,}' | perl -pe 's/[a-z]{1,}(-[0-9]{1,}){1,}-//g;s/-/\n/g;' | sort | uniq