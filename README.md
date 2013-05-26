# Python.el

python.el is now distributed with Emacs; this repository is no longer
maintained.

## Info

+ Author: Fabián Ezequiel Gallina
+ Contact: fgallina at gnu dot org
+ Project homepage: http://github.com/fgallina/python.el
+ My Blog: http://www.from-the-cloud.com
+ IRC: #python.el at freenode!

Donations welcome!

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=fgallina&url=https://github.com/fgallina/python.el&title=python.el&language=en_GB&tags=github&category=software)

## Install

If you are using Emacs 24.3 you already have a version of
python.el. If you are using an Emacs 24.x prior 24.3 or you want to
update your copy with some of the enhancements happening on Emacs'
repository you can download python.el from the following URLs:

+ from Emacs' emacs-24 branch: <http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el>
+ from Emacs' trunk branch: <http://repo.or.cz/w/emacs.git/blob_plain/master:/lisp/progmodes/python.el>

The trunk version does its best to keep compatible with Emacs 24.x but
it may break, although fixing compatibility breakage is priority (fill
a bug report if you happen to find this).

Put `python.el` where you place all your Emacs Lisp files and
byte-compile it. One way to do it is to visit the file with Emacs and
then issue `M-x byte-compile-file`

After that add the following to your `.emacs`:

```emacs-lisp
(add-to-list 'load-path "/folder/containing/file")  ;; if it's not already in `load-path'
(require 'python)
```

The most simple installation option is to use
[el-get](https://github.com/dimitri/el-get) and add either `python` or
`python24` to your list of packages.

In case your el-get recipes are outdated you can append the following
to your `el-get-sources` depending on the version you prefer:

```emacs-lisp
(:name python
       :description "Python's flying circus support for Emacs (trunk version, hopefully Emacs 24.x compatible)"
       :type http
       :url "http://repo.or.cz/w/emacs.git/blob_plain/master:/lisp/progmodes/python.el")
```

OR

```emacs-lisp
(:name python24
       :description "Python's flying circus support for Emacs (24.x)"
       :builtin "24.3"
       :type http
       :url "http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el")
```

## Introduction

This is now the official Python major mode for GNU Emacs.

It aims to provide the stuff you'll expect from a major mode for
python editing while keeping it simple.

Currently it implements Syntax highlighting, Indentation, Movement,
Shell interaction, Shell completion, Shell virtualenv support, Pdb
tracking, Symbol completion, Skeletons, FFAP, Code Check, Eldoc,
Imenu.

+ Syntax highlighting
+ Solid (auto)indentation support
+ auto-detection of indentation levels for current file
+ Robust triple quoted strings support
+ Fancy variable assignment colorization
+ Movement commands you'll expect from a major-mode.
+ Sexp-like movement
+ Python shell integration (not only for Python 2 but also Python 3!)
+ Python shell completion (Same as above!)
+ Python shell virtualenv support (as simple as setting a variable!)
+ PDB Tracking (it even supports ipdb!)
+ Symbol completion that sucks because a running inferior shell
  process and valid code in the current buffer are needed (Don't blame
  me, it's like that in every python-mode I know). Notice I don't
  recommend this thing, use ropemacs instead
+ Skeletons with a tight integration with dabbrev out of the box
+ FFAP (Find Filename At Point), click on an import statement and go
  to the module definition.
+ Code check via pychecker by default (this is customizable of
  course)
+ Eldoc support (this suffers the same drawbacks as the symbol
  completion, but it's the only sane way to do it from Elisp)
+ imenu support to easily navigate your code
+ add-log-current-defun support
+ hideshow support
+ outline support
+ fill paragraph (with customizable docstring formatting)

The code is well organized in parts with some clean sensitive naming.

## Requirements

None, besides Emacs>=24.

## Emacs 23?

Latest know version to work with Emacs 23 can be found at
<https://github.com/fgallina/python.el/tree/emacs23> any
functionality/bugfixing back-port that may (or may not) happen in the
future will be placed there.

## Bug Reports

The github bug-tracker is being deprecated.

To report bugs, or to contribute fixes and improvements, use the
built-in Emacs bug reporter (M-x report-emacs-bug) or send email to
bug-gnu-emacs@gnu.org. You can browse Emacs bug database at
debbugs.gnu.org. For more information on contributing, see the
CONTRIBUTE file (distributed with Emacs).

## License

python.el is free software under the GPL v3, see LICENSE file for
details.
