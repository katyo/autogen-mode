[![unstable](http://badges.github.io/stability-badges/dist/unstable.svg)](http://github.com/badges/stability-badges)

## Overview

This is a [GNU AutoGen](https://www.gnu.org/software/autogen/) template editing mode for [GNU Emacs](https://www.gnu.org/software/emacs/). It uses [`polymode`](https://github.com/vitoshka/polymode) package to combine the root `c-mode` with `autogen-mode` in template directives. Using `scheme-mode` for scheme chunks into templates currently not supported.

## Installation

*Note: Oldest supported Emacs version is 24.4*

### From [MELPA](https://github.com/milkypostman/melpa)

<kbd>M-x</kbd> `package-install` `polymode-autogen`.

### Manually

First install `polymode` package from [*here*](https://github.com/vitoshka/polymode).

```sh
git clone https://github.com/katyo/autogen-mode.git
```

Add "autogen-mode" directory to your emacs path and load mode to use:

```lisp
(add-to-list 'load-path "path/to/autogen-mode")
(require 'polymode-c-autogen)
```

Now you can activate mode manually:

<kbd>M-x</kbd> `poly-c+autogen-mode`

For automatic activation you can use special comment in templates:

```
[+ autogen5 template -*- mode: poly-c+autogen; -*- +]
```
