// tests/playwright.config.js
const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './',
  outputDir: 'test-results',
  retries: 1,
  use: {
    headless: true,
    video: 'retain-on-failure',
    trace: 'on-first-retry',
  },
  reporter: [['html', { open: 'never' }]],
});
