# aws-actions-cheats

[![ci](https://github.com/chiefbiiko/aws-actions-cheats/workflows/ci/badge.svg)](https://github.com/chiefbiiko/aws-actions-cheats/blob/master/.github/workflows/ci.yml)

utility functions 4 interacting with aws from an actions pipeline

## usage

simply use `aws-actions-cheats` as a step in your workflow

``` yml
steps:
  - uses: chiefbiiko/aws-actions-cheats
    run: s3_url bucket key
    # => https://bucket.s3.amazonaws.com/key
```

## license

[MIT](./LICENSE)