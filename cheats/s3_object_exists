#!/usr/bin/env bash

s3_object_exists() {
  # usage: s3_object_exists $bucket_name $key
  # requires: s3:HeadObject
  if [[ -z $1 ]]; then
    printf "usage: s3_object_exists \$bucket_name \$key\n"
    return 1
  elif [[ $1 =~ -h|--help ]]; then
    printf "usage: s3_object_exists \$bucket_name \$key\n"
    return 0
  fi

  stdout="$(aws s3api head-object --bucket="$1" --key="$2" 2>&1)"
  exit_code=$?

  if [[ $stdout == *404* ]]; then
    return 1
  elif [ $exit_code == 0 ]; then
    return 0
  else
    printf "$stdout\n" 1>&2
    return 1
  fi
}