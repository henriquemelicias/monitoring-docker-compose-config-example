# --------------------------- #
# --------- BUILDER --------- #
# --------------------------- #
FROM rust:latest AS builder

RUN update-ca-certificates

ENV CARGO_TERM_COLOR always

WORKDIR /app-example
COPY ./ .

# -------------------------- #
# --------- IMAGE ---------- #
# -------------------------- #
FROM gcr.io/distroless/cc

# Import builder.
COPY --from=builder /bin/sh /bin/sh
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

WORKDIR /app-example


# Copy binaries.
COPY --from=builder /app-example/example_runnable/* ./

ENTRYPOINT ["/bin/sh", "./create_logs.sh"]
