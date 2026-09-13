FROM docker.litellm.ai/berriai/litellm:latest

WORKDIR /app
COPY config.yaml /app/config.yaml

# Render injects $PORT (usually 10000). Default to 4000 if not set.
ENV PORT=4000

EXPOSE ${PORT}
CMD ["sh", "-c", "litellm --config /app/config.yaml --port ${PORT} --host 0.0.0.0"]