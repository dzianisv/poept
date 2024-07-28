# Use the official Alpine image
FROM python:3.11-alpine


# Install system dependencies
RUN apk update && apk add --no-cache bash \
    chromium \
    chromium-chromedriver

COPY . /app
WORKDIR /app/
RUN pip install --no-cache-dir /app/
RUN rm -rf /app/

EXPOSE 8080
# Run the service
CMD ["python3", "-m", "poept.server"]