const tailwind = require('../tailwind')

module.exports = {
  pathPrefix: '/caiopo.com', // Prefix for all links. If you deploy your site to example.com/portfolio your pathPrefix should be "/portfolio"

  siteTitle: 'Caio\'s Personal Page', // Navigation and Site Title
  siteTitleAlt: 'Caio\'s Personal Page', // Alternative Site title for SEO
  siteTitleShort: 'caiopo', // short_name for manifest
  siteHeadline: 'Mobile Developer headquartered in Florianópolis, Brazil', // Headline for schema.org JSONLD
  siteUrl: 'https://caiopo.github.io', // Domain of your site. No trailing slash!
  siteLanguage: 'en', // Language Tag on <html> element
  siteLogo: '/logo.png', // Used for SEO and manifest
  siteDescription: 'Playful & Colorful One-Page website with Parallax effect',
  author: 'LekoArts', // Author for schema.org JSONLD

  // siteFBAppID: '123456789', // Facebook App ID - Optional
  userTwitter: '@caiopo', // Twitter Username
  ogSiteName: 'caiopo', // Facebook Site Name
  ogLanguage: 'en_US', // Facebook Language
  googleAnalyticsID: 'UA-135068155-2',

  // Manifest and Progress color
  themeColor: tailwind.colors.orange,
  backgroundColor: tailwind.colors.blue,
}
