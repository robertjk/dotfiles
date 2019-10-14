Things to learn in Vim
======================

TODO: Add missing things from chapters 8-11 of 'Practical Vim'

Modes
-----

### Normal mode

- [x] g~, gu, gU - Invert case
- [ ] Y - Copies the whole line, just like yy

### Insert mode

- [ ] <C-o> - Switch to insert normal mode (execute one normal command)
- [ ] <C-r><C-p> - Paste from register fixing unwanted indentation
- [ ] <C-r>= - Paste calculations
- [ ] <C-v>{nondigit} - Insert non-digt character literally, e.g. Tab
- [ ] <C-v>(ddd|udddd) - Insert character by 3-digit decimal code or 4-digit
  hexadecimal code (unicode)
- [ ] ga - Find out numeric code for any character in the document
- [ ] <C-k>{c1}{c2} - Insert digraph represented by 2 chars (:h digraphs-table)
- [ ] [g]R - Replace mode [virtual - treating tabs as spaces]

### Visual mode

- [x] gv - Reselect last visual selection
- [ ] u, U, ~ - Transform text to lowercase/uppercase/toggle

### Command-line mode

- [ ] :e[dit] - Load the most recent version of the file
- basic commands
  * [ ] :print - prints specified lines
  * [ ] :delete - delete specified lines
  * [ ] :put [{register}] - puts (pastes) text from register r
  * [ ] :copy (:t) - copy spcified lines to specified address
  * [ ] :move (:m) - move spcified lines to specified address
  * [ ] :join - join spcified lines
  * [ ] :normal - execute normal commands on each specified line
    + [ ] `:'<,'>normal` . - powerful pattern
  * [x] :substitute - find and replace pattern with text
  * [ ] :global - execute ex commands on lines matching specified pattern
  * [ ] :read !{cmd} - execute a command and insert it output below the cursor
  * [ ] {range} :write !{cmd} - execute command in shell with range as stdin
  * [ ] {range}! {filter} - filter specified range through external filter cmd
- ranges for commands (format: {address1},{address2}, e.g. 3,10print):
  + [ ] {n} line number n
  + [ ] $ - last line
  + [ ] . - current line
  * [ ] '<,'> - visual selection
  * [ ] '{mark} - line with given mark
  * [ ] /{pattern1}/,/{pattern2}/
  * [ ] {address1}+{offset1},{address2}+{offset2} - offsets for start and end
  * % - entire file (shorthand for 1,$)
- [ ] @: - Repeat last Ex command
- [ ] <C-r><C-w>, <C-r><C-a> - Insert word/WORD under cursor to command prompt
- [ ] q:, q/ - Open command line window for Ex commands or searches
  * [ ] <C-f> - Switch from command line mode to command line window
- [ ] !{command} - Run shell command
- [ ] :shell - Run shell in Vim
- [ ] <C-z> - Put Vim in the background and return to shell (get back by fg)
- [ ] :source {file} - Source script with Ex commands


Files
-----

### Manage Multiple Files

- [ ] :ls - Display bufferst list
- [ ] :bnext, :bprev, ]b, [b - Move across buffers list
- [x] <C-^> - Switch to the alternate file
- [x] :args - Display arguments list
- [x] :args <files> - Populate arguments list with given files
    + <files> can use wildcards, but also backtick expansion! (`shell-command`)
- [x] :set hidden - Enable hiding modified buffers

### Open Files and Save Them to the Disk

- [ ] :e . - Open file explorer for current working directory
- [ ] :Ex - Open file explorer for directory of current buffer
- [ ] :!mkdir -p %:h - Make directory for current file (if doesn't exist)

Getting Around Faster
---------------------

### ...

- [ ] Ctrl-w n - Open new window split with empty file

Registers
---------

- [ ] "0 - Yank register

Patterns
--------

### Matching Patterns and Literals

- [ ] /\c, /\C - Force case-insesitivity, case-sensitvity
- [ ] /\_class - Character class + newline character
- [ ] /%(...) - Non-capturing group
- [ ] . - Last insert mark
- [ ] \0, \1, \2, ... - Full search match, captured groups

### Search

- [ ] gn/gN - Select next/previous search match in visual mode | text object
- [ ] gn/gN - Motion to operate on the search match (allows dot formula)
- [ ] <C-r><C-w> - Autocompletes search field with word under cursor
- [ ] :s///gn - Count number of search occurences
- [ ] :vimgrep //g % - Populate quickfix list with search matches
- [ ] /.../e - Position cursor on the end of the match
- [ ] *, # - Search for word under the cursor forwards/backwards

### Substitution

- [ ] flags:
  * e - silence errors of patterns not found
  * c - confirm every substitution
  * n - print number of occurences instead of doing actual substitution
  * & - use the same flags ad previous substitute
- [ ] :s/.../\=@r/& - Use contents of register r (by reference), so that all
      contents are properly escaped (which is not true when using <C-r>r)
- [ ] :s/.../~/ - Reuse latest substitute replacement
  [ ] repeat last subsitution:
  * :& - without flags
  * :&& - with previously used flags (new range can be specified, e.g. :%&&)
  * g& - repeat last subsitution across entire file (equivalent to :%s//~/&)
- [ ] :s/.../\=submatch(n)... - Perform arithmetic on match/submatch
- [ ] Project-wide substitution:
    :vim[grep] /.../
    :cfdo %s//.../g | update
- [ ] :s/\%V.../.../ - Run subsitution only on visual selection part of the lines

### Global
- [ ] :g[lobal] /.../ <cmd> - Global command
- [ ] :v[global] - Invert global command
- [ ] :global// - Use last search pattern
- [ ] global /.../sil <cmd> - Silence messages of command <cmd>
- [ ] :global/.../delete - Delete lines matching pattern
- [ ] :global/.../yank R - Yank lines matching pattern into one register

Tools
-----

### Tags
- [ ] <C-]>, g<C-]> - Jump to tag under cursor
- [ ] <C-t> - Jump back a tag
- [ ] :tselect - Display tags list for last tag
- [ ] [t, ]t - :tprev, :tnext
- [ ] :tag, :tjump - Ex commands for <C-]> and g<C-]>; also accept // pattern

### Compile code and quick-fix list

- [ ] :make[!] - "compile" code [without jumping to first error]
- [ ] :copen - Open quickfix window
- [ ] :cdo, :cfdo - Execute command for each line/file in quickfix list
- [ ] :lmake, :lgrep, :lvimgrep - Use location list instead of quickfix list
- [ ] [q, ]q, [l, ]l - :cprev, :cnext, :lprev, :lnext
- [ ] [<C-Q>, ]<C-Q>, [<C-L>, ]<C-L> - :cpfile, :cnfile, :lpfile, :lnfile
- [ ] :colder, :cnewer - Switch quickfix list to previous/next version
- [ ] makeprg - Variable with command run on :make
- [ ] errorformat - Variable with parsing settings for makeprg command output
- [ ] :compiler - Sets both makeprg and errorformat using pre-defined profile

### Search project-wide (grep etc.)

- [ ] :grep - Use grep command, (accepts grep syntax not Vim's)
- [ ] grepprg, grepformat - Control command used for :grep searches
- [ ] :vimgrep /.../ - Use Vim native search engine
- [ ] :vimgrep /.../ ## - Run vimgrep on each file in arguments list

### Autocompletion

- triggering:
  * [ ] <C-p>, <C-n> - Generic keyword autocompletion
  * [ ] <C-x><C-n> - Current buffer keywords
  * [ ] <C-x><C-i> - Included file keywords
  * [ ] <C-x><C-]> - Tag file keywords
  * [ ] <C-x><C-k> - Dictionary lookup
  * [ ] <C-x><C-l> - Whole line completition
  * [ ] <C-x><C-f> - Filename completition
  * [ ] <C-x><C-o> - Omni completition
  * [ ] <C-n><C-p> - Summon the list but still allow to type (works with all types)
  * [ ] multiple times (e.g. <C-x><C-n> <C-x><C-n>...) - Sequence of words
- interaction:
  * [ ] <C-p>, <C-n> - Select and use previous/next match
  * [ ] <C-y> - Use selected suggestion
  * [ ] <C-e> - Do not use any suggestion and close autocompletion popup
  * [ ] <C-h> - Remove one character from the current match
  * [ ] <C-l> - Add one character from the current match
- [ ] completion - List of places to look up for generic autocompletion
- [ ] dictionary - List of dictionaries

### Spell checking

- [ ] :set spell - Enable spellchecking
- [ ] :set spelllang - Language for spellchecking, e.g.:
    * en_us
    * en_gb
- [ ] :set spellfile - List of files with additional spelling words
- [ ] [s, ]s - Previous/next flag word (possible spelling mistake)
- [ ] z= - Display correction suggestions for current flagged word
- [ ] <C-x><C-s> - Display corrections for the closest flagged word in line
- [ ] [count] zg, zw - Add/remove current word to/from spell file [spellfile #]
- [ ] zuw - Revert zg/zw command for current word

Options
-------

- [x] :set option? - Check option value
- [ ] :set option! - Toggle option
- [ ] :set option& - Set default value
- [ ] :setlocal - Set only for current window or buffer
- [ ] :bufdo setlocal, :windo setlocal - Set for all buffers/windows

Plugins
-------

### File explorer (Netrw, Dirvish)
- [ ] :E[xplore], :Se[xplore], :Ve[xplore] - Open file explorer

### Abolish
- [ ] :S/.../[Ivw] - Search
- [ ] :S/.../.../[Ivw] - Substitute
- [ ] :S/.../[Ivw] <files>... - Grep
- [ ] cr(c|m|_|s|u|U|-|k|.| |t) - Coerce current word

### CtrlP
- [ ] <C-d> - Toggle between full-path and filename only search
- [ ] <S-Tab> - Switch between results and input
- [ ] <C-]> - Delete a character (like <C-h>)
- [ ] <C-z> - Mark file for opening multiple files
- [ ] <C-o> - Open multiple marked files
- [ ] <F7> - Wipe MRU list, wipe marked MRU/buffer entries
