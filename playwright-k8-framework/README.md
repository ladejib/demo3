# Playwright Testing Framework on Kubernetes

## Overview
Run scalable Playwright tests on Kubernetes using the official Playwright image, git-sync, sharded Jobs, and S3 report storage.

## Components
- Playwright Official Docker Image
- Git-sync Sidecar to pull tests
- Kubernetes Jobs (Indexed) for test sharding
- Merge Job to combine Playwright results
- AWS CLI to upload results to S3

## Deployment Steps
1. Clone this repo
2. Set up AWS Secret with S3 credentials
3. Build and push Docker image
   ```bash
   make build
   make push

