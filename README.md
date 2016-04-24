## Vim Configuration (dotvim)

My dotvim using the `neocomplete.vim` instead of `YouCompleteMe` for
code completion. Vim need to be installed with `lua` language support.

## Basic Installation

```sh
git clone https://github.com/agilecreativity/dotvim.git ~/dotvim
cd ~/dotvim
git submodule init
git submodule update
make install
```

## Post-installation procedure

### Build CommandT

Provided that you build the vim yourself or use the recent version of vim
you should be able to use CommandT without any issue.

You can check the version of ruby compiled with vim using this simple vimscript

``` vim
function! RubyInfo()
  ruby <<EOF
    puts "Your Vim's ruby information:"
    puts "ruby version : #{RUBY_VERSION}"
    puts "ruby platform: #{RUBY_PLATFORM}"
    puts "release date : #{RUBY_RELEASE_DATE"}
  EOF
endfunction
```

called with `:call RubyInfo()` from inside vim. This will get you something like

or simple just type `:ruby puts RUBY_VERSION` from inside vim

e.g. On my Arch Linux system, I got the following:

```
Your Vim's ruby information:
ruby version : 2.3.0
ruby platform: x86_64-linux
release date : 2015-12-25
```

On my Mac/OSX::

```
Your Vim's ruby information:
ruby version : 2.0.0
ruby platform: universal.x86_64-darwin15
release date : 2015-12-16
```

Now you can build the CommandT as follow

```sh
cd ~/.vim/bundle/Command-T/ruby/command-t
# check the version of ruby
ruby -v

# Make sure that it is same as the result of `:ruby puts RUBY_VERSION` above
ruby extconf.rb
make
```
Now your CommandT should be installed and ready to use.

### Notes

All of the bundles installed with NeoBundle except the `neobundle.vim` in the
bundle directory should be ignored. This make it more portable to work on
different computer that may or may not have the same version of vim configuration.
