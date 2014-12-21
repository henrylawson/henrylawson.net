henrylawson.net
===============
A simple blog powered by Jekyll.

Getting Started
===============
1. Install RVM
2. Make sure correct Ruby version has been loaded (check .ruby-version)
3. gem install bundler
4. bundle install
5. Create SSH config for "henrylawson.net" as referened in build.yml, check ~/.ssh/config or see the "Setting Up SSH" notes below
6. rake Rakefile --describe

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

Running in Cloud9
=================
In Cloud9, ensure no Apache processes are running and run:

``
rake serve[$IP,$PORT]
``

So that the required IP and Port are provided by C9.
