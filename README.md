# aws-actions-cheats

[![ci](https://github.com/chiefbiiko/aws-actions-cheats/workflows/ci/badge.svg)](https://github.com/chiefbiiko/aws-actions-cheats/blob/master/.github/workflows/ci.yml)

utility `bash` functions 4 interacting with aws from an actions pipeline

`aws-actions-cheats` should encompass common cli operations that can not be done with the `aws-cli` in a simple manner, i.e. on one line.

please pull request to add more utils!

## usage

simply use `aws-actions-cheats` as a step in your workflow

then, use the `bash` utility functions in subsequent steps

``` yml
steps:
  - uses: chiefbiiko/aws-actions-cheats
  - run: yo_s3_url=$(s3_url bucket k/e/y)
    # => https://bucket.s3.amazonaws.com/k/e/y
```

## license

[MIT](./LICENSE)