## jscs.vim

A vim plugin that wraps `jscs -x` into a `:Format` command, for use within Vim.
Can accept range or operate on the whole file.

### Installation

- First, you need jscs installed globally: npm install jscs -g
- Extract the files and put them in your VIM directory (usually `~/.vim/`)

If you don't have a preferred installation method, I recommend installing
[vim-plug](https://github.com/junegunn/vim-plug) and using the following configuration:

    Plug 'mklabs/jscs.vim', { 'do': 'npm i jscs -g' }

so that vim-plug takes care of installing jscs for you.

### :Format

The single command exposed by this plugin.

Accepts a range and is usable in Visual mode.

Ex.

    plugin.commandSync('Cmd', {
        range: '',
        nargs: '*',
    }, function( nvim, args, range, cb ) {
        try {
            incrementCalls()
            nvim.setCurrentLine(
                fmt('Command: Called', numCalls, 'times, args:', args, 'range:', range),
                cb )
        } catch ( err ) {
            cb( err )
        }
    })

Running `:Format` while run jscs in fix mode on the whole file and replace the current buffer with the result.

### Configuration

The default configuration uses airbnb styleguide, you can change the configuration used by jscs with:

    let g:jscs_config = "/path/to/.jscsrc"
