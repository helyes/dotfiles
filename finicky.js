finicky.setDefaultBrowser('com.google.Chrome');

// https://github.com/johnste/finicky
finicky.onUrl(function(url, opts) {
  if (url.match(/^https?:\/\/(www\.pivotaltracker|circleci|github|.*\.newrelic|.*\.codeship|.*\.zendesk)\.com/)) {
  	// bundleIdentifier: "org.mozilla.firefoxdeveloperedition"
  	// bundleIdentifier: "com.apple.safari"
    return {
       bundleIdentifier: "org.mozilla.firefoxdeveloperedition"
    };
  }

  // Safari
  if (url.match(/^https?:\/\/(trello)\.com/)) {
    // bundleIdentifier: "org.mozilla.firefoxdeveloperedition"
    // bundleIdentifier: "com.apple.safari"
    return {
      bundleIdentifier: "com.apple.safari"
    };
      
  }
});
