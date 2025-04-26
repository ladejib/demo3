# demo3

### Build application
docker build --no-cache -t flask-shop .
docker run -p 5000:5000 flask-shop

### Run test


### Build
npm init -y
npm install --save-dev @playwright/test
npx playwright install

Then update your package.json scripts:

"scripts": {
  "test": "npx playwright test"
}
docker-compose up --build --abort-on-container-exit
