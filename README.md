# LiteLLM Proxy

A lightweight Dockerized LiteLLM proxy configured for multi-model routing and deployment (e.g., Render or local Docker).

## Models Configured

- `custom/gemini-3.8-flash` (Gemini API)
- `custom/deepseek-flash` (DeepSeek API)

## Environment Variables

| Variable | Description |
|---|---|
| `GEMINI_API_KEY` | API key for Google Gemini |
| `DEEPSEEK_API_KEY` | API key for DeepSeek |
| `LITELLM_MASTER_KEY` | Master key securing proxy endpoints |
| `PORT` | Optional port override (defaults to `4000`) |

## Quickstart

### Run with Docker

```bash
docker build -t litellm-proxy .
docker run -p 4000:4000 \
  -e GEMINI_API_KEY="your-gemini-key" \
  -e DEEPSEEK_API_KEY="your-deepseek-key" \
  -e LITELLM_MASTER_KEY="your-master-key" \
  litellm-proxy
```

### Example Request

```bash
curl http://localhost:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-master-key" \
  -d '{
    "model": "custom/gemini-3.8-flash",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```
