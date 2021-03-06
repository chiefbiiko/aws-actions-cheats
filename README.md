# aws-actions-cheats

[![ci](https://github.com/chiefbiiko/aws-actions-cheats/workflows/ci/badge.svg)](https://github.com/chiefbiiko/aws-actions-cheats/actions?query=workflow%3Aci)

![bash](https://badges.frapsoft.com/bash/v1/bash.png?v=103) utils 4 interacting with aws from actions pipelines

please pull request if u have anything 2 add

## usage

simply use `aws-actions-cheats` as a step in your workflow

then call the cheats in subsequent steps

``` yml
steps:
  - uses: chiefbiiko/aws-actions-cheats@v0.1.2
  - run: yo_s3_url=$(s3_url bucket k/e/y)
    # => https://bucket.s3.amazonaws.com/k/e/y
```

## commands

#### `cognito_user_exists $userpool_id $username`

check for existence of a cognito user

note this func does not check if the user is confirmed

*requires: cognito-idp:AdminGetUser*

**example**

```sh
if cognito_user_exists us-east-1_abcdefgh alibaba; then
  printf "user alibaba exists\n"
fi
```

#### `s3_bucket_exists $bucket_name`

check for existence of an owned s3 bucket

*requires: s3:HeadBucket*

**example**

```sh
if s3_bucket_exists yo-bucket; then
  printf "yo-bucket exists\n"
fi
```

#### `s3_object_exists $bucket_name $key`

check for existence of an owned s3 object

*requires: s3:HeadObject*

**example**

```sh
if s3_object_exists yo-bucket k/e/y; then
  printf "object exists\n"
fi
```

#### `s3_uri $bucket_name [$key]`

format a s3 uri

handles keys with or without leading slash

**example**

```sh
s3_uri bucket k/e/y
# => s3://bucket/k/e/y
```

#### `s3_url $bucket_name [$key]`

format a s3 url

handles keys with or without leading slash

**example**

```sh
s3_url bucket k/e/y
# => https://bucket.s3.amazonaws.com/k/e/y
```

## todo

* fix `s3_url` and `s3_uri`

## license

[MIT](./LICENSE)