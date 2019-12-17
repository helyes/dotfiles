module.exports = {
  defaultBrowser: "Safari",
  handlers: [
    {
      // Open shiftcare related links in Firefox Developer Edition
      match: finicky.matchHostnames([
        /.*\.pivotaltracker.com|.*\.newrelic.com|docs\.google.com|mixpanel\.com|circleci\.com|github\.com/,
        /.*aws\.amazon\.com|.*app\.getbeamer\.com/
      ]),
      browser: "Firefox Developer Edition"
    },
    {
      // Open shiftcare apps in google chrome
      match: finicky.matchHostnames([
        /[app|admin].*\.shiftcare.com.*/
      ]),
      browser: "Google Chrome"
    }
  ]
};
