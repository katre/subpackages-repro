# Issue with `subpackages()`

To reproduce:

First run, clean checkout:
```
$ bazel-dev clean
$ bazel-dev build //:demo
DEBUG: /usr/local/google/home/jcater/repos/subpackages-repro/sub.bzl:6:10: sub: Found subpackages bar, baz, foo
INFO: Analyzed target //:demo (4 packages loaded, 6 targets configured).
INFO: Found 1 target...
Target //:demo up-to-date (nothing to build)
INFO: Elapsed time: 1.069s, Critical Path: 0.03s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```

This correctly sees the subpackages `bar`, `baz`, and `foo`.

Second run:
```
$ bazel-dev build //:demo
DEBUG: /usr/local/google/home/jcater/repos/subpackages-repro/sub.bzl:6:10: sub: Found subpackages bar, baz, bazel-subpackages-repro, foo
INFO: Analyzed target //:demo (1 packages loaded, 1 target configured).
INFO: Found 1 target...
Target //:demo up-to-date (nothing to build)
INFO: Elapsed time: 0.195s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
INFO: Build completed successfully, 1 total action
```

This additionally sees the `bazel-subpackages-repro` symlink created in the
first run.
