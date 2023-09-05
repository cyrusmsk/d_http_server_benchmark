# Examples for web frameworks in D

Some D HTTP frameworks with simple benchmark

## Motivation
This repo is used to test code locally and then send PR to https://github.com/the-benchmarker/web-frameworks

## Usage
To run example use Docker commands (in case you need LTO enabled).
It is possible to run locally - but be aware of dflags-ldc option for LTO.

Currently only local runs are tested.

# Alternative run
Because some frameworks have problems with 'wrk' tool, for this repo it was used 'bambardier' tool.
All runs were done with 'ulimit -n 1024'.

Results of the run for each framework is available in result folder.

Table with results prepared by analysis tools.

## Credits
* [Bombardier](https://github.com/codesenberg/bombardier)
* [web-benchmark project](https://github.com/the-benchmarker/web-frameworks)
* [Tomas httpbench](https://github.com/tchaloupka/httpbench)
