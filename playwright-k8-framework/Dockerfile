FROM mcr.microsoft.com/playwright:v1.43.1-jammy

# Install AWS CLI to upload reports to S3/MinIO
RUN apt-get update && apt-get install -y awscli

WORKDIR /app

# Nothing copied here. Tests and config will be mounted at runtime via Git-sync.

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]

