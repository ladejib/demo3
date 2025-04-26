#!/bin/bash

set -e

# Assume tests are cloned into /tests directory by git-sync
cd /tests

# Run sharded tests
npx playwright test --shard=${JOB_COMPLETION_INDEX}/${TOTAL_SHARDS}

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

