FROM alpine:3.18 AS build

RUN apk add --no-cache ldc gcc dub musl-dev llvm-libunwind-static llvm15 openssl

RUN mkdir /home/app

ADD archttp_example /home/app

WORKDIR /home/app

ENV DC=ldc2
RUN dub build -b release-nobounds --compiler=ldc2 --verbose

FROM alpine:3.18

WORKDIR /opt/web

RUN apk add --no-cache ldc llvm-libunwind-static llvm15 openssl

COPY --from=build /home/app/server /opt/web/server

CMD /opt/web/server
