Description
===========

Installs the Hipchat exception handler.

Requirements
============

We assume the API key is stored in an (unencrypted) databag, so this
cookbook cannot be used in Solo mode.

Attributes
==========

* node[:hipchat_handler][:version] - The version of the Gem to install
* node[:hipchat_handler][:room_name] - The Hipchat room to send exceptions to

Usage
=====

include_recipe "hipchat_handler"

Or add "recipe[hipchat_handler]" to your run list.

Roadmap
=======

Make the use of the data bag optional. Some users might just want to hardcode
the API key in a node attribute.

Upgrade to HipChat gem 0.5.0.
