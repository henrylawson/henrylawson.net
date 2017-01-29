henrylawson.net
===============
A simple blog powered by Jekyll.

Getting Started
---------------
1. Install rbenv
1. Make sure correct Ruby version has been loaded (check .ruby-version)
1. gem install bundler
1. bundle install
1. git-crypt unlock
1. Install LinkChecker `pip install linkchecker`
1. Install Readability `pip install readability`
1. Install brew dependencies `brew tap Homebrew/brewdler && brew brewdle`
1. rake Rakefile --describe

Updating Fonts
--------------
```
find . -iname "*.ttf" -exec woff2_compress "{}" \;
find . -iname "*.ttf" -exec sfnt2woff-zopfli "{}" \;
find . -iname "*.ttf" -exec bash -c 'ttf2eot < {} > {}.eot' \;
```

Updating Images
---------------
```
find . -name "*.png" -exec optipng -o7 -zm1-9 {} \;
mogrify -format gif *.png
mogrify -background white -alpha remove -resize '1400x1400' -format gif *.png
```

Deploying
---------
1. Review posts and articles, check grammar `rake s`
1. Checking spelling `rake sp`
1. Check hyperlinks `rake lc`
1. Check the readability statistics 'rake ws'
1. Make a commit and push
1. Publish the content `rake dp`

Manual Review
-------------
1. [Disqus](https://disqus.com/admin)
1. [Amazon Affiliate Program](https://affiliate-program.amazon.com/)
1. [Google Analytics](https://www.google.com/analytics/)
1. [Google Webmaster Tools (Search Console)](https://www.google.com/webmasters/tools/home)
1. [Google Custom Search](https://cse.google.com/)

Testing Review
--------------
1. [Google Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool)
1. [Google Mobile Friendly Testing Tool](https://search.google.com/search-console/mobile-friendly)
1. [Google Page Speed Tool](https://developers.google.com/speed/pagespeed/insights/)
1. [Hubpsot Website Grader](https://website.grader.com/results/henrylawson.net)
1. [Pingdom](https://tools.pingdom.com)
1. [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/sharing/)
1. [Twitter Card Validator](https://cards-dev.twitter.com/validator)
1. [Google+ Snippets](https://developers.google.com/+/web/snippet/)
1. [Security Headers](https://securityheaders.io/)
1. [Web Page Test](http://www.webpagetest.org/)
1. [lighthouse](https://github.com/GoogleChrome/lighthouse)

Testing
-------
1. Design and Layout
  1. Chrome
  1. Safari
  1. Firefox
  1. Internet Explorer
  1. Android
  1. iPad
  1. iPhone
  1. Various Resolutions
1. Google Structured Data
  1. Organization
  1. BreadcrumbList
  1. WebSite
  1. Person
  1. BlogPosting
1. Social Sharing
  1. Facebook
  1. Twitter
  1. Google+

Writing Process
---------------
1. Pick a topic
1. Create a draft `rake 'd[date,title]'`
1. Create the article
  1. Plan
  1. Research
  1. Rethink
  1. Find a lede
  1. Write fast (write don't edit)
  1. Let it incubate
  1. Revise and copy edit
1. Move the article to be live `mv ./website/_drafts/*.markdown ./website/_posts/`
1. Review the article deployed `rake s`
1. Run the spelling check `rake sp`
1. Run the static analysis `rake ws[full-article-name]`
1. Check for dead links `rake lc`
1. Review the article AGAIN deployed `rake s`
1. Push the changes to remote
1. Deploy it `rake dp`
1. Clear CDN cache `rake iv`
