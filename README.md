# dotfiles: README

This is just a collection of dotfiles in my home directory I use personally.
They contain snippets of things I've found useful collected from other's
dotfiles, my own tinkering, and various places around the Internet.

Snippets shamelessly borrowed from some of the following....
 * https://github.com/jfrazelle/dotfiles
 * https://github.com/necolas/dotfiles
 * https://dotfiles.github.io
 * Other sources I forgot to make note of....



## How to use this repo

First you should fork this so you have your own copy.

After you fork it do the following...

  cd ~
  git clone --recursive git@example.com:username/dotfiles.git
  cd dotfiles
  ./linkem
  cd ~
  source .bashrc
  source .profile

That should be it. Note the "--recursive" as there are submodules.

## Updating

  cd ~/dotfiles
  git pull origin master
  git submodule update --init --recursive
  git submodule foreach git pull origin master
  ./linkem
  cd ~
  source .bashrc

## License

No license has been assigned to this project.

.
