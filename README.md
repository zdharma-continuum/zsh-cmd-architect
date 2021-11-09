![zca logo](http://imageshack.com/a/img911/7375/ZWHW5Y.png)

[![Gitter](https://badges.gitter.im/zdharma-continuum/community.svg)](https://gitter.im/zdharma-continuum/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Zsh Command Architect

Also check out [![ZNT](http://imageshack.com/a/img910/3618/oDHnuR.png) Zsh Navigation Tools](https://github.com/zdharma-continuum/zsh-navigation-tools)
and [![ZEW](http://imageshack.com/a/img908/3869/Vsd2c6.png) Zsh Editing Workbench](https://github.com/zdharma-continuum/zsh-editing-workbench)

Zsh Command Architect in action:
![zca](http://imageshack.com/a/img905/3617/grLOeP.gif)

## Installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zsh-cmd-architect/master/doc/install.sh)"
```

To update run the command again.

`ZCA` will be installed at `~/.config/zca/zsh-cmd-architect`, config files will be copied to `~/.config/zca`. `.zshrc`
will be updated with only `4` lines of code that will be added to the bottom.

After installing and reloading shell give `ZCA` a quick try with `Ctrl-T`.

## Installation With [Zplugin](https://github.com/zdharma-continuum/zplugin)

Add `zplugin load zdharma-continuum/zsh-cmd-architect` to `.zshrc`. The config files will be available in `~/.config/zca`.

## Installation With Zgen

Add `zgen load zdharma-continuum/zsh-cmd-architect` to `.zshrc` and issue a `zgen reset` (this assumes that there is a proper `zgen save` construct in `.zshrc`).
The config files will be available in `~/.config/zca`.

## Installation With Antigen
Add `antigen bundle zdharma-continuum/zsh-cmd-architect` to `.zshrc`. There also
should be `antigen apply`. The config files will be in `~/.config/znt`.

## Manual Installation

After extracting `ZCA` to `{some-directory}` add following two lines to `~/.zshrc`:

```zsh
fpath+=( {some-directory} )
source "{some-directory}/zsh-cmd-architect.plugin.zsh"
```

As you can see, no plugin manager is needed to use the `*.plugin.zsh`
file. The above two lines of code are all that almost **all** plugin
managers do. In fact, what's actually needed is only:

```zsh
source "{some-directory}/zsh-cmd-architect.plugin.zsh"
```

because `ZCA` detects if it is used by **any** plugin manager and can
handle `$fpath` update by itself.

## Single File Manual Installation

Running script `doc/generate_single_file` will create single-file version of `ZCA`.
It can be sourced from `.zshrc`. Don't forget about configuration files (copy them to `~/.config/zca`).

## Introduction

`ZCA` allows to copy segments of commands in history, rearrange segments of current command,
delete segments of current command. This way user glues command from parts without using
a mouse. Advanced history search (multi word, without duplicate lines) allows to quickly find
the parts.

Keys are:
- `Ctrl-T` - start Zsh Command Architect (Zshell binding)
- `Enter` - delete selected segment (when in command window) or add selected segment (when in history window)
- `[` or `]` - move active segment (when in command window)
- `Shift-left` or `Shift-right` - move active segment (when in command window)
- `Tab` - switch between the two available windows
- `g, G` - beginning and end of the list
- `/` - start incremental search
- `Esc` - exit incremental search, clearing filter
- `<`,`>`, `{`,`}` - horizontal scroll
- `Ctrl-L` - redraw of whole display
- `Ctrl-O`, `o` - enter uniq mode (no duplicate lines)
- `Ctrl-W` (in incremental search) - delete whole word
- `Ctrl-K` (in incremental search) - delete whole line
- `Ctrl-D`, `Ctrl-U` - half page up or down
- `Ctrl-P`, `Ctrl-N` - previous and next (also done with vim's j,k)

## Performance

`ZCA` is fastest with `Zsh` before `5.0.6` and starting from `5.2`

# Fixing tmux, screen and linux vt

If `TERM=screen-256color` (often a case for `tmux` and `screen` sessions) then
`ncv` terminfo capability will have `2`nd bit set.  This in general means that
underline won't work. To fix this by creating your own `ncv=0`-equipped
terminfo file, run:

```zsh
{ infocmp -x screen-256color; printf '\t%s\n' 'ncv@,'; } > /tmp/t && tic -x /tmp/t
```

A file will be created in directory `~/.terminfo` and will be automatically
used, `tmux` and `screen` will work. Similar is for Linux virtual terminal:

```zsh
{ infocmp -x linux; printf '\t%s\n' 'ncv@,'; } > /tmp/t && tic -x /tmp/t
```

It will not display underline properly, but will instead highlight by a color,
which is quite nice. The same will not work for FreeBSD's vt, `ZCA` will detect
if that vt is used and will revert to highlighting elements via `reverse` mode.
