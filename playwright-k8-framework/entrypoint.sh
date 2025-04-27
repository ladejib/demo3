#!/bin/bash

set -e

# Assume tests are cloned into /tests directory by git-sync
cd /tests

# Kubernetes Indexed Jobs, so JOB_COMPLETION_INDEX starts at 0, 
# but Playwright expects shards starting from 1.
echo "[entrypoint] Calculating shard index..."
SHARD_CURRENT=$((JOB_COMPLETION_INDEX + 1))

# Run sharded tests
echo "[entrypoint] Running Playwright tests with shard ${SHARD_CURRENT}/${TOTAL_SHARDS}..."
npx playwright test --shard=${SHARD_CURRENT}/${TOTAL_SHARDS}

echo "[entrypoint] Uploading the JSON Results to S3..."
# Upload JSON results to S3
if [ -f "playwright-report/results.json" ]; then
    echo "Uploading results.json to S3..."
    aws s3 cp playwright-report/results.json s3://${S3_BUCKET}/${S3_RESULTS_PREFIX}/${JOB_COMPLETION_INDEX}-results.json
fi

# Upload individual HTML reports
if [ -d "playwright-report" ]; then
    echo "Uploading HTML report to S3..."
    aws s3 cp playwright-report/ s3://${S3_BUCKET}/${S3_REPORTS_PREFIX}/${JOB_COMPLETION_INDEX}/ --recursive
fi

