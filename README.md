# MultiSSH

Multihost SSH command runner.

## Introduction

MultiSSH allows you to run SSH commands across multiple hosts concurrently.
It provides a graphical, streaming visualization of the output for each host.

The application is built on top of the [electron](http://electron.atom.io/) framework.

## Current Status

Experimental. Available only as an invitation to contribute to the project.
The base application scaffolding isn't even complete yet.

## Running MultiSSH

There are currently no binaries provided for this project.
This is something that will be implemented at a later time.

For now, follow this procedure to launch the application shell:

* Install a recent release of NodeJS or IO.js
* Clone this repository.
* run `npm install`
* On windows, run `npm run-script win`
* On OSX, run `npm run-script osx`

## Development

### Stack

* [Electron](http://electron.atom.io/)
* [Coffeescript](http://coffeescript.org/)
* [Jade](http://jade-lang.com/)
* [Stylus](https://learnboost.github.io/stylus/)
* [Grunt](http://gruntjs.com/)

### Getting Started

* Install a recent release of NodeJS or IO.js
* Clone this project
* `npm install`
* `grunt serve`

Please use Github pull requests and issues for this project.

Please follow the [conventional-changelog conventions](https://github.com/ajoslin/conventional-changelog/blob/master/CONVENTIONS.md) for your commit messages.

## Supported Operating Systems

Linux & OSX until a good SSH adapter can be implemented for Windows.

## TODO

* Complete initial UI scaffolding
* Set up bower for UI dependencies
  * Import initial dependencies (react, jquery, bootstrap, font-awesome)
* Set up scaffolding for unit tests (mocha)
* Initial UI with basic functionality
  * Host configuration (env vars, range builder widget, CSV import)
  * Preferences pane
    * SSH, layout, logging options
  * Documentation
  * Session monitor
* Auto-update setup
* Crash reporter setup
* Graphical assets
* Internationalization
* NPM publish
* Native package build & distribution

## License

[ISC](http://opensource.org/licenses/ISC)
