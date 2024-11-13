# Alex's dotfiles

Hi there! (probably Alex), I have made this `README.md` for you to better understand your own configuration.

## What is this

Explain shit about complex detached git repository

## Project Structure

In your config we have the following files:

- [**`.Xresources`**](./.Xresources): A file made to configure `X` or `XOrg`. In particular, we use it for configuring the dpi. You can see more in the [Arch Wiki]("https://wiki.archlinux.org/title/X_resources").
- [**`.gitmodules`**](./.gitmodules): Since this is a wierd git, we have to specify any submodules. In this case, the file contains `alacritty` themes.
- [**`.tmux.conf`**](./.tmux.conf): The `tmux` config file. Remember that tmux is the shit you use to split terminals.
- [**`.zshrc`**](./.zshrc): Your `zsh` configuration file.
- [**`.config/`**](./.config): Where some other things are configured
  - [**`alacritty`**](./.config/alacritty/): Where we configure Alacritty. It is not that complex to need it's own `README`.
