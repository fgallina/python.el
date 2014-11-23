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

If you are using Emacs 24.3 you already have a version of python.el.
If you are using an Emacs 24.x prior 24.3 or you want to update your
copy with some of the enhancements happening on Emacs add the
following snippet in your `.emacs`:

```emacs-lisp

(add-to-list 'load-path user-emacs-directory)

(defun my:ensure-python.el (&optional branch overwrite)
  "Install python.el from BRANCH.
After the first install happens the file is not overwritten again
unless the optional argument OVERWRITE is non-nil.  When called
interactively python.el will always be overwritten with the
latest version."
  (interactive
   (list
    (completing-read "Install python.el from branch: "
                     (list "master" "emacs-24")
                     nil t)
    t))
  (let* ((branch (or branch "master"))
         (url (format
               (concat "http://git.savannah.gnu.org/cgit/emacs.git/plain"
                       "/lisp/progmodes/python.el?h=%s") branch))
         (destination (expand-file-name "python.el" user-emacs-directory))
         (write (or (not (file-exists-p destination)) overwrite)))
    (when write
      (with-current-buffer
          (url-retrieve-synchronously url)
        (delete-region (point-min) (1+ url-http-end-of-headers))
        (write-file destination))
      (byte-compile-file destination t)
      destination)))

(my:ensure-python.el)
```

The `master` branch does its best to remain compatible with Emacs 24.x
but it may break, although fixing compatibility breakage is priority
(fill a bug report if you happen to find this).  The "emacs-24" tends
to be safer but new features are not added into it.

Whatever flavor you choose, if you are using a version prior to Emacs
24.3 you need `cl-lib`[0] which is available from GNU ELPA[1] package
archive.

[0] http://elpa.gnu.org/packages/cl-lib.html
[1] http://elpa.gnu.org/

### Alternate method with el-get

If you are using el-get already you can install `python24` for the
current `emacs-24` branch version or `python` for the `master` branch.

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
