const { test, expect } = require('@playwright/test');

test('user can login', async ({ page }) => {
  await page.goto('http://flask-shop:5000/login');
  await page.fill('input[name="username"]', 'admin');
  await page.fill('input[name="password"]', 'password');
  await page.click('button[name="Login"]');
  await expect(page).toHaveURL('http://flask-shop:5000/products');
});
