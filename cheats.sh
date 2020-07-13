#!/usr/bin/env bash

# these functions require an aws identity with access to s3:? and/or s3api:?

s3_uri() {
  # usage: s3_uri $bucket_name [$key]
  if [[ -z $1 ]]; then
    printf "usage: s3_uri \$bucket_name [\$key]\n"
    return 1
  elif [[ $1 =~ -h|--help ]]; then
    printf "usage: s3_uri \$bucket_name [\$key]\n"
    return 0
  fi

  if [[ -n $2 && $2 == /* ]]; then
    key=$2
  elif [[ -z $2 ]]; then
    key=""
  else
    key="/$2"
  fi

  printf "s3://$1$key"
}

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

s3_bucket_exists() {
  # usage: s3_bucket_exists $bucket_name
  # requires: s3:HeadBucket
  if [[ -z $1 ]]; then
    printf "usage: s3_bucket_exists \$bucket_name\n"
    return 1
  elif [[ $1 =~ -h|--help ]]; then
    printf "usage: s3_bucket_exists \$bucket_name\n"
    return 0
  fi

  stdout="$(aws s3api head-bucket --bucket="$1" 2>&1)"
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