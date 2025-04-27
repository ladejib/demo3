FROM mcr.microsoft.com/playwright:v1.50.0-noble

# # Install AWS CLI to upload reports to S3/MinIO
# RUN apt-get update && apt-get install -y awscli

RUN apt-get update && apt-get install -y unzip curl && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

WORKDIR /app

COPY entrypoint.sh .

# Nothing copied here. Tests and config will be mounted at runtime via Git-sync.

ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]

