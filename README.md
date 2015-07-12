henrylawson.net
===============
A simple blog powered by Jekyll.

Getting Started
===============
1. Install rbenv
1. Make sure correct Ruby version has been loaded (check .ruby-version)
1. gem install bundler
1. bundle install
1. Create SSH config for "henrylawson.net" as referened in build.yml, check ~/.ssh/config or see the "Setting Up SSH" notes below
1. Install LinkChecker `pip install linkchecker`
1. Install Readability `pip install readability`
1. Install brew dependencies `brew tap Homebrew/brewdler && brew brewdle`
1. rake Rakefile --describe

Setting Up SSH
==============
Ensure the ~/.ssh/config has an entry like below:
``
Host henrylawson.net
  HostName henrylawson.net
  Port 22
  IdentityFile ~/.ssh/id_rsa
  User ubuntu
``

And that the ~/.ssh/id_rsa.pub is added to the remote hosts ~/.ssh/authorized_keys.

Updating Fonts
==============
find . -iname "*.ttf" -exec woff2_compress "{}" \;
find . -iname "*.ttf" -exec sfnt2woff-zopfli "{}" \;
find . -iname "*.ttf" -exec bash -c 'ttf2eot < {} > {}.eot' \;

Deploying
=========
1. Review posts and articles, check grammar `rake s`
1. Checking spelling `rake sp`
1. Check hyperlinks `rake lc`
1. Make a commit and push
1. Publish the content `rake p`
