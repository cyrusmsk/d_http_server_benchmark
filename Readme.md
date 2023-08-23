# Examples for wev frameworks in D

## Motivation
This repo is used to test code locally and then send PR to https://github.com/the-benchmarker/web-frameworks

## Usage
To run example use Docker commands.

It is possible to run locally - but be aware of dflags-ldc option for LTO.
Most of the tests were done on M1 machine.

# Alternative run

Because some frameworks have problems with 'wrk' tool, for this repo it was used 'bambardier' tool.
All runs were done with 'ulimit -n 1024'

Command to run:
```sh
./bombardier-darwin-arm64 -c {64,512} -d 10s -l http://localhost:3000
```
Results of the run for each framework is available in result folder.

This is tables:
for 64 concurrent connections

|    Parameter |     Cgi |   Handy | Lighttp | Serverino | Archttp |
| :----------- | ------: | ------: | ------: | --------: | ------: |
|  Req/seq avg |  68535  |  17457  |  17723  |   84089   |  44203  |
|  Latency avg | 0.37 ms | 4.31 ms | 4.75 ms |  760. us  | 1.55 ms |
|  Latency 90% | 1.30 ms | 3.38 ms | 3.69 ms |  331. us  | 2.60 ms |
|  Latency 95% | 1.93 ms | 3.64 ms | 3.99 ms |  431. us  | 3.03 ms |
|  Latency 99% | 3.98 ms | 4.47 ms | 4.63 ms |  2.03 ms  | 4.46 ms |

for 512 cincurrent connections

|    Parameter |     Cgi |   Handy | Lighttp | Serverino | Archttp |
| :----------- | ------: | ------: | ------: | --------: | ------: |
|  Req/seq avg |  69557  |   7197  |   9503  |   44582   |  42432  |
|  Latency avg | 12.2 ms | 71.4 ms | 58.2 ms |  11.4 ms  | 14.0 ms |
|  Latency 90% | 1.30 ms | 124. ms | 103. ms |  639. us  | 22.1 ms |
|  Latency 95% | 1.95 ms | 176. ms | 122. ms |  748. us  | 27.2 ms |
|  Latency 99% | 4.05 ms | 333. ms | 465. ms |  12.1 ms  | 70.4 ms |

## Credits
* [Bombardier](https://github.com/codesenberg/bombardier)
