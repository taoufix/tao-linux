https://unix.stackexchange.com/questions/65507/use-setxkbmap-to-swap-the-left-shift-and-left-control/65600#65600



`xmodmap` is obsolete; so indeed it should be done with the `xkb` tools.

The swap you want seems not to be included by default with X11 files; so you have to write it yourself.

The page https://web.archive.org/web/20170825051821/http://madduck.net/docs/extending-xkb/ helped me to understand and find a way to do it.

Create a file `~/.xkb/keymap/mykbd` where you put the output of `setxkbmap`, it will be your base keyboard definition; eg:

    setxkbmap -print > ~/.xkb/keymap/mykbd

then, create a symbols file to define your key swapping, put it for example in `~/.xkb/symbols/myswap`

there, put the following lines:

    partial modifier_keys
    xkb_symbols "swap_l_shift_ctrl" {
    	replace key <LCTL>  { [ Shift_L ] };
    	replace key <LFSH> { [ Control_L ] };
    };

then, edit the `~/.xkb/keymap/mykbd` file, and change the `xkb_symbols` line to add

    +myswap(swap_l_shift_ctrl)

finally, you can load it with `xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY` (you cannot use "~" for the `-I` parameter).

It will probably spit a lot of warnings about undefined symbols for some rare keys, but you can ignore them (eg, redirect error to dave: `2> /dev/null`).

If you want to be able to easily swap between a normal and your inverted ctrl/shift one; just create under `~/.xkb/keymap/` another file, without the extra "myswap" option, and load it with `xkbcomp`. You can make two small scripts to load them.
