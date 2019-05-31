# drone-jsonnet-convert-test

[![Build Status](https://cloud.drone.io/api/badges/suzuki-shunsuke/drone-jsonnet-convert-test/status.svg)](https://cloud.drone.io/suzuki-shunsuke/drone-jsonnet-convert-test)
[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/drone-jsonnet-convert-test.svg)](https://github.com/suzuki-shunsuke/drone-jsonnet-convert-test)
[![License](http://img.shields.io/badge/license-mit-blue.svg?style=flat-square)](https://raw.githubusercontent.com/suzuki-shunsuke/drone-jsonnet-convert-test/master/LICENSE)

The example [Drone](https://drone.io) pipeline which tests whether .drone.yml is generated from .drone.jsonnet properly.

At Drone v1, [jsonnet](https://jsonnet.org) is recommended officially.

https://docs.drone.io/user-guide/pipeline/migrating/

> To simplify your configuration we recommend using jsonnet.

And when [Drone's Jsonnet extension](https://docs.drone.io/extend/config/jsonnet/) isn't supported,
you have to convert .drone.jsonnet to .drone.yml and commit them.

This Drone pipeline tests whether .drone.yml is generated from .drone.jsonet properly.
This converts .drone.jsonnet to the yaml format and raise error if it is different from .drone.yml .

Success case

```console
$ drone exec
[drone jsonnet:0] + sh test_drone_jsonnet_convert.sh
[drone jsonnet:1] + drone jsonnet --format --target /tmp/.drone.yml
[drone jsonnet:2] + diff .drone.yml /tmp/.drone.yml
```

Failure case

```console
$ drone exec
[drone jsonnet:0] + sh test_drone_jsonnet_convert.sh
[drone jsonnet:1] + drone jsonnet --format --target /tmp/.drone.yml
[drone jsonnet:2] + diff .drone.yml /tmp/.drone.yml
[drone jsonnet:3] --- .drone.yml
[drone jsonnet:4] +++ /tmp/.drone.yml
[drone jsonnet:5] @@ -14,5 +14,4 @@
[drone jsonnet:6]    environment:
[drone jsonnet:7]      JSONNET_OPTS: --format
[drone jsonnet:8]
[drone jsonnet:9] -
[drone jsonnet:10]  ...
[drone jsonnet:11] There is diff between .drone.yml and .drone.jsonnet
2019/05/31 12:56:29 drone jsonnet : exit code 1
```

For detail, please see source codes.

* .drone.jsonnet
* test_drone_jsonnet_convert.sh

## License

[MIT](LICENSE)
