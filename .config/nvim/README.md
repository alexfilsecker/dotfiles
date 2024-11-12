# Alex's NeoVim Configuration

Hi you! (probably Alex) in this `README.md` I want to show you how you have setted up your own **NeoVim** configuration.

## File Distribution

You probably will forget how this project's structure is set up, so here is a remainder:

### Root or this dir

Here you will find the following files

- [**`README.md`**](./README.md): This `README.md`
- [**`.luarc.json`**](./.luarc.json): The `lua` local configuration file. For now we use it to add `vim` to the globals.
- [**`.stylua.toml`**](./.stylua.toml): The `stylue` local configuration file. Is like a `prettier.rc` file.
- [**`.lazy-lock.json`**](./.lazy-lock.json): Like a `package-lock.json` but for `Lazy`, your `NeoVim` package manager.
- [**`init.lua`**](./init.lua): The origin of all the `NeoVim` configuration. As you will see, it only imports two things: the `Lazy` configuration and our `core` arguments.
- [**`lua/`**](./lua/): This is a directory that contains the `alex/` directory or my configuration. It has been intended that way so that one can have more than one configuration.
  - [**`alex/`**](./lua/alex/): My real configuration folder.
    - [**`core/`**](./lua/alex/core/): A folder to contain all the general settings.
      - [**`init.lua`**](./lua/alex/core/init.lua): A file similar to `__init__.py`, it imports from `keymaps.lua` and `options.lua` so that we can later import just `alex.core`.
      - [**`keymaps.lua`**](./lua/alex/core/keymaps.lua): Where all the non-pluggin associated keymaps are stored. You should go take a look.
      - [**`options.lua`**](./lua/alex/core/options.lua): This is where we can find all non-pluggin related options. You should go take a look.
    - [**`lazy.lua`**](./lua/alex/lazy.lua): This file is where `Layz`, you package manager is set-up.
