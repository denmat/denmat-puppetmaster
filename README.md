# puppetmaster

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with puppetmaster](#setup)
    * [What puppetmaster affects](#what-puppetmaster-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppetmaster](#beginning-with-puppetmaster)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module will currently install a puppet master with an embedded puppetdb.

Still to come:
  * deploy postgresql backed puppetdb 
 
## Module Description

This module is designed to build a local puppet master, run either in a Vagrant or Docker container. 
It uses Hiera to lookup vars and is designed to work with https://github.com/denmat/vagrant-docker

### What puppetmaster affects

* /etc/puppet/puppet.conf and other files in the /etc/puppet directory
* installs puppetdb, puppet client and puppet master
* manages the puppetmaster daemon service with a plan to notify httpd

### Setup Requirements 

None.

### Beginning with puppetmaster

This Module relies on the following list of puppet modules:
https://github.com/denmat/vagrant-docker/blob/master/Puppetfile

<!--
## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
-->
