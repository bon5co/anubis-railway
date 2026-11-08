# Anubis for Railway.
# Upstream TecharoHQ/anubis v1.28.2 pinned by digest. Anubis is a reverse proxy that puts a proof-of-work challenge in
# front of a site and lets non-browser clients through. This wrapper bakes every literal setting into the image so the
# template carries no blank required variable: it listens on 8080 (Railway's injected PORT, which the public domain
# targets), serves metrics on 9090 for the private network, and keeps the cookie domain dynamic so one deploy can
# front any hostname. The deployer-owned values (TARGET, ED25519_PRIVATE_KEY_HEX, PUBLIC_URL) are template variables.
FROM ghcr.io/techarohq/anubis@sha256:5fcbce70ee6168be5b226d19bec90111d0acd0daf13028fa06b044cf3ebbbd5f

ENV BIND=:8080 \
    METRICS_BIND=:9090 \
    DIFFICULTY=4 \
    SERVE_ROBOTS_TXT=false \
    COOKIE_DYNAMIC_DOMAIN=true \
    OG_PASSTHROUGH=true \
    OG_EXPIRY_TIME=1h \
    SLOG_LEVEL=INFO
