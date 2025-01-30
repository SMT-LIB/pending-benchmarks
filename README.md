# Pending Benchmarks

The benchmarks collected in this repository use features that will be included
in future SMT-LIB releases.  Hence, they are not currently SMT-LIB compliant,
and are not part of the official benchmark release.

When the non-standard features used by a problem set becomes part of the
SMT-LIB standard, this set will be included in the next official benchmark
release.

All benchmarks collected here follow the style guidelines of the official
[benchmark release](https://github.com/SMT-LIB/pending-benchmarks).

## Benchmark Sets

* `non-incremental/AUFBVDTNIA/20240618-LibMLKEM/`
   * uses `nat2bv` and `bv2nat`
   * checked using Dolmen with `--ext=bvconv`.
