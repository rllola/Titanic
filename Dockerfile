##### BUILDER #####
FROM rust:latest AS builder

WORKDIR /usr/src/titanic
COPY . .
RUN --mount=type=cache,target=/app/target/ \
    --mount=type=cache,target=/usr/local/cargo/git/db \
    --mount=type=cache,target=/usr/local/cargo/registry/ \
    cargo install --path .

##### RUNNER #####
FROM debian:bookworm

LABEL author="Lola Rigaut-Luczak <me@laflemme.lol>"
LABEL description="God himself could not sink this ship."

COPY --from=builder /usr/local/cargo/bin/titanic /usr/local/bin/titanic

RUN apt-get update && rm -rf /var/lib/apt/lists/*

# default env
ENV RUST_LOG="titanic=info"

ENTRYPOINT ["titanic"]