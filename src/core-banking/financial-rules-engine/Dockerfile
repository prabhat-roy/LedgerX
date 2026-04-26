FROM haskell:9.6 AS builder
WORKDIR /build
COPY package.yaml ./
RUN stack init --resolver lts-22.0 || true
COPY src src
RUN stack build --copy-bins --local-bin-path /out

FROM debian:bookworm-slim
WORKDIR /app
RUN apt-get update && apt-get install -y libgmp10 ca-certificates && rm -rf /var/lib/apt/lists/* \
 && groupadd -r app && useradd -r -g app app
COPY --from=builder /out/financial-rules-engine /app/app
USER app
EXPOSE 60026
ENTRYPOINT ["/app/app"]
