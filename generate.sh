#!/bin/sh
haxelib run dox -o docs -i xml/js.xml --title "NPM for Haxe" --toplevel-package "npm" -theme flambe
git archive -o docs/offline.zip HEAD docs
