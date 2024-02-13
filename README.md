# ibus.vim

Change ibus input engine automatically when switch between normal and insert mode.

## Features

- Remember status when switch windows even the `Share the same input method among all applications` option is off.

## Configuration

```vim
let g:ibus_insert_engines = ['rime', 'mozc-jp']
let g:ibus_normal_engines = ['xkb:us::eng']
let g:ibus_no_mappings = 1
```

`g:ibus_insert_engines` are input engines used when switch to insert mode. Use `ibus engine` to find the name of input engine.

`g:ibus_no_mappings = 1` will disable default key mapping.

## Default Key Mapping

Toggle ibus.vim on/off.

```vim
imap <C-A-I><C-A-I> <Plug>IbusToggle
nmap <C-A-I><C-A-I> <Plug>IbusToggle
```

Switch to next input engine.

```vim
imap <C-A-I><C-A-P> <Plug>IbusEngineNext
nmap <C-A-I><C-A-P> <Plug>IbusEngineNext
```

Switch to previous input engine.

```vim
imap <C-A-I><C-A-O> <Plug>IbusEnginePrev
nmap <C-A-I><C-A-O> <Plug>IbusEnginePrev
```

## FAQ

**Why input engine changing is so slow when switch between windows?**

`ibus` restore input status when `Share the same input method among all applications` is off. If change input engine after focusing vim immediately, `ibus` will change it back, so this plugin will delay the change 0.5 seconds when switch between windows.

## Related Projects

- [kevinhwang91/vim-ibus-sw: Switch ibus between vim insert and normal mode.](https://github.com/kevinhwang91/vim-ibus-sw)
- [Neur1n/neuims: An input method switcher.](https://github.com/Neur1n/neuims)
- [Vim/GVimで「日本語入力固定モード」を使用する](https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-japanese/ime-control)
- [h-youhei/vim-ibus: ibus controller for vim](https://github.com/h-youhei/vim-ibus)
