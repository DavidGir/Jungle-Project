const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://0.0.0.0:3000', 
    specPattern: 'cypress/integration/**/*.spec.js',

    setupNodeEvents(on, config) {
      // setupNodeEvents configuration
      on('before:browser:launch', (browser = {}, launchOptions) => {
        // Configuration or actions to take before the browser launches
      });
    },
  },
  screenshotsFolder: "tmp/cypress_screenshots",
  videosFolder: "tmp/cypress_videos",
  trashAssetsBeforeRuns: false
});
