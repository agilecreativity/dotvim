## Vim Configuration (dotvim)

My dotvim using the `neocomplete.vim` instead of `YouCompleteMe` for
code completion.

## Basic Installation

```
git clone https://github.com/agilecreativity/dotvim-neo.git ~/dotvim-neo
cd ~/dotvim-neo
git submodule init
git submodule update
make install
```

## Post-installation procedure

### Link to the private aliases

If you really wan't to keep the private links to yourself then you could
do the following

``` shell
ln s ~/Dropbox/config/aliases.vim ~/.vim/aliases.vim
```

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

``` text
Your Vim's ruby information:
ruby version : 2.0.0
ruby platform: x86_64-darwin13.0.0
release data : 2013-06-27
```

Now you can build the CommandT as follow

``` shell
cd ~/.vim/bundle/Command-T/ruby/command-t
rbenv local system # or whatever the version we got back from `:ruby puts RUBY_VERSION` from inside Vim
rbenv rehash
ruby extconf.rb
make
```

Now your CommandT should be ready to use.

### Notes

All of the bundles installed with NeoBundle except the `neobundle.vim` in the
bundle directory should be ignored. This make it more portable to work on
different computer that may or may not have the same version of vim configuration.

For example you may use Mac at home but use Linux at work and some plugins
(e.g. `CommandT`) may need to be compiled/configured differently based on the
platform used.

### Tips

- [Writing Clojure in Vim](https://robots.thoughtbot.com/writing-clojure-in-vim)
