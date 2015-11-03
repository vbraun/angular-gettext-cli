angular-gettext-cmdline
=======================

A command line interface for angular-gettext-tools

Note
----

This is a fork of https://github.com/huston007/angular-gettext-cli
with incompatible command-line options. On the plus side, it also lets
you perform the compilation step from the commandline.


Installation
------------

TODO: Doesn't work yet: `npm install angular-gettext-cmdline --save-dev`


Usage
-----

Extract the translatable strings from the source file(s):

   angular-gettext extract src/file.html bar/**/*.html` --output template.pot

Then translate `template.pot`; The result is a a file `en.po` for the
English translation and `fr.po` for the French translation,
say. Compile it to javascript:

    angular-gettext compile en.po fr.po --output gettext-module.js

Then import it in your AngluarJs app.


Online Help
-----------

    $ ./bin/angular-gettext
    usage: angular-gettext {extract,compile} --output filename [file1 file2 ...]
    
    Available subcommands:
        extract     Extract strings from sources and write them to a .pot file
        compile     Compile .po files to javascript
    
    The input files can also be globs like www/**/*.html
    