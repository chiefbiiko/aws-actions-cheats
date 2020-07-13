#!/usr/bin/env bash

s3_url() {
  # usage: s3_url $bucket_name [$key]
  if [[ -z $1 ]]; then
    printf "usage: s3_url \$bucket_name [\$key]\n"
    return 1
  elif [[ $1 =~ -h|--help ]]; then
    printf "usage: s3_url \$bucket_name [\$key]\n"
    return 0
  fi

  if [[ -n $2 && $2 == /* ]]; then
    key=$2
  elif [[ -z $2 ]]; then
    key=""
  else
    key="/$2"
  fi

  printf "https://$1.s3.amazonaws.com$key"
}