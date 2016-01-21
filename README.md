![zca logo](http://imageshack.com/a/img911/7375/ZWHW5Y.png)

# Zsh Command Architect

Also check out [![ZNT](http://imageshack.com/a/img910/3618/oDHnuR.png) Zsh Navigation Tools](https://github.com/psprint/zsh-navigation-tools)
and [![ZEW](http://imageshack.com/a/img908/1139/rE2HjR.png) Zsh Editing Workbench](https://github.com/psprint/zsh-editing-workbench)

Zsh Command Architect in action:
![zca](http://imageshack.com/a/img905/3617/grLOeP.gif)

## Installation

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-cmd-architect/master/doc/install.sh)"
```

To update run the command again.

`ZCA` will be installed at `~/.config/zca/zsh-cmd-architect`, config files will be copied to `~/.config/zca`. `.zshrc`
will be updated with only `4` lines of code that will be added to the bottom.

After installing and reloading shell give `ZCA` a quick try with `Ctrl-T`.

## Installation With Zgen

Just add `zgen load psprint/zsh-cmd-architect` to `.zshrc` and issue a `zgen reset` (this assumes that there is a proper `zgen save` construct in `.zshrc`).
The config files will be available in `~/.config/zca`.

## Installation With Antigen
Add `antigen bundle psprint/zsh-cmd-architect` to `.zshrc`. There also
should be `antigen apply`. The config files will be in `~/.config/znt`.

## Single File Manual Installation

Running script `doc/generate_single_file` will create single-file version of `ZCA`.
It can be sourced from `.zshrc`. Don't forget about configuration files (copy them to `~/.config/zca`).

## Introduction

`ZCA` allows to copy segments of commands in history, rearrange segments of current command,
delete segments of current command. This way user glues command from parts without using
a mouse. Advanced history search (multi word, without duplicate lines) allows to quickly find
the parts.

Keys are:
- `Ctrl-t` - start Zsh Command Architect (default binding)
- `Enter` - delete selected segment (when in command window) or add selected segment (when in history window)
- `Shift-left` or `Shift-right` - move active segment (when in command window)
- `Tab` - switch between the two available windows
- `/` - start incremental search
- `Esc` - exit incremental search, clearing filter
- `<`,`>`, `{`,`}` - horizontal scroll
- `Ctrl-d`, `Ctrl-u` - half page up or down
- `Ctrl-p`, `Ctrl-n` - previous and next (also done with vim's j,k)
- `Ctrl-l` - redraw of whole display
- `g, G` - beginning and end of the list
- `Ctrl-o`, `o` - enter uniq mode (no duplicate lines)
- `Ctrl-w` (in incremental search) - delete whole word
- `Ctrl-k` (in incremental search) - delete whole line

## Performance

`ZCA` is fastest with `Zsh` before `5.0.6` and starting from `5.2`
