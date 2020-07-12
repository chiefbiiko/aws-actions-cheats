#!/usr/bin/env bash

# these functions require an aws identity with access to s3:? and/or s3api:?

s3_bucket_exists() {
  # usage: s3_bucket_exists $bucket_name
  # requires: s3:HeadBucket
  stdout="$(aws s3api head-bucket --bucket="$1" 2>&1)"
  exit_code=$?
  case "$stdout" in
    *404*)
      false
    ;;
    *)
      if [ $exit_code == 0 ]; then
        true
      else
        printf "$stdout\n" 1>&2
        false
      fi
    ;;
  esac
}

s3_object_exists() {
  # usage: s3_object_exists $bucket_name $key
  # requires: s3:HeadObject
  stdout="$(aws s3api head-object --bucket="$1" --key="$2" 2>&1)"
  exit_code=$?
  case "$stdout" in
    *404*)
      false
    ;;
    *)
      if [ $exit_code == 0 ]; then
        true
      else
        printf "$stdout\n" 1>&2
        false
      fi
    ;;
  esac
}