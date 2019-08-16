# dotfiles

I use this to prevent configuration drifts between different machines I work on.

To use it simply clone this repository and run `./bootstrap.sh`.

The bootstrap only has to be ran once. After that you can just do `./install.sh`
after each git pull to get the latest updates.

**NOTE:** To manipulate the gnome terminal through scripting there has to be an initial profile.
If you never used gnome terminal before simply open the preferences and just do a single edit
for a profile to be created, like hiding the scrollbar.

After running the first bootstrap please restart your computer for all changes to take effect.
