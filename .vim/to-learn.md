Things to learn in Vim
======================

TODO: Add missing things from chapters 6-11 of 'Practical Vim'

Modes
-----

### Normal mode

- [ ] g~, gu, gU - invert case

### Insert mode

- [ ] <C-o> - switch to insert normal mode (execute one normal command)
- [ ] <C-r><C-p> - paste from register fixing unwanted indentation
- [ ] <C-r>= - paste calculations
- [ ] <C-v>{nondigit} - insert non-digt character literally, e.g. Tab
- [ ] <C-v>(ddd|udddd) - insert character by 3-digit decimal code or 4-digit
  hexadecimal code (unicode)
- [ ] ga - find out numeric code for any character in the document
- [ ] <C-k>{c1}{c2} - insert digraph represented by 2 chars (:h digraphs-table)
- [ ] [g]R - replace mode [virtual - treating tabs as spaces]

### Visual mode

- [x] gv - reselect last visual selection
- [ ] u, U, ~ - transform text to lowercase/uppercase/toggle

### Command-line mode

- basic commands
  * [ ] :print - prints specified lines
  * [ ] :delete - delete specified lines
  * [ ] :put [{register}] - puts (pastes) text from register r
  * [ ] :copy (:t) - copy spcified lines to specified address
  * [ ] :move (:m) - move spcified lines to specified address
  * [ ] :join - join spcified lines
  * [ ] :normal - execute normal commands on each specified line
    + [ ] :'<,'>normal . - powerful pattern
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
- [ ] @: - repeat last Ex command
- [ ] <C-r><C-w>, <C-r><C-a> - insert word/WORD under cursor to command prompt
- [ ] q:, q/ - open command line window for Ex commands or searches
  * [ ] <C-f> - switch from command line mode to command line window
- [ ] !{command} - run shell command
- [ ] :shell - run shell in Vim
- [ ] <C-z> - put Vim in the background and return to shell (get back by fg)
- [ ] :source {file} - source script with Ex commands


Registers
---------

- [ ] "0 - yank register

Patterns
--------

### Matching Patterns and Literals

- [ ] /\c, /\C - force case-insesitivity, case-sensitvity
- [ ] /\_class - character class + newline character
- [ ] /%(...) - non-capturing group
- [ ] `. - last insert mark
- [ ] \0, \1, \2, ... - full search match, captured groups

### Search

- [ ] gn/gN - select next/previous search match in visual mode | text object
- [ ] gn/gN - motion to operate on the search match (allows dot formula)
- [ ] <C-r><C-w> - autocompletes search field with word under cursor
- [ ] :s///gn - count number of search occurences
- [ ] :vimgrep //g % - populate quickfix list with search matches
- [ ] /.../e - position cursor on the end of the match
- [ ] *, # - search for word under the cursor forwards/backwards

### Substitution

- [ ] flags:
  * e - silence errors of patterns not found
  * c - confirm every substitution
  * n - print number of occurences instead of doing actual substitution
  * & - use the same flags ad previous substitute
- [ ] :s/.../\=@r/& - use contents of register r (by reference), so that all
      contents are properly escaped (which is not true when using <C-r>r)
- [ ] :s/.../~/ - reuse latest substitute replacement
  [ ] repeat last subsitution:
  * :& - without flags
  * :&& - with previously used flags (new range can be specified, e.g. :'<,'>&&)
  * g& - repeat last subsitution across entire file (equivalent to :%s//~/&)
- [ ] :s/.../\=submatch(n)... - perform arithmetic on match/submatch
- [ ] Project-wide substitution:
    :vim[grep] /.../
    :cfdo %s//.../g | update

### Global
- [ ] :g[lobal] /.../ <cmd> - global command
- [ ] :v[global] - invert global command
- [ ] :global// - use last search pattern
- [ ] global /.../sil <cmd> - silence messages of command <cmd>
- [ ] :global/.../delete - delete lines matching pattern
- [ ] :global/.../yank R - yank lines matching pattern into one register

Tools
-----

### Tags
- [ ] <C-]>, g<C-]> - jump to tag under cursor
- [ ] <C-t> - jump back a tag
- [ ] :tselect - display tags list for last tag
- [ ] [t, ]t - :tprev, :tnext
- [ ] :tag, :tjump - Ex commands for <C-]> and g<C-]>; also accept // pattern

### Compile code and quick-fix list

- [ ] :make[!] - "compile" code [without jumping to first error]
- [ ] :copen - open quickfix window
- [ ] :cdo, :cfdo - execute command for each line/file in quickfix list
- [ ] :lmake, :lgrep, :lvimgrep - use location list instead of quickfix list
- [ ] [q, ]q, [l, ]l - :cprev, :cnext, :lprev, :lnext
- [ ] [<C-Q>, ]<C-Q>, [<C-L>, ]<C-L> - :cpfile, :cnfile, :lpfile, :lnfile
- [ ] :colder, :cnewer - switch quickfix list to previous/next version
- [ ] makeprg - variable with command run on :make
- [ ] errorformat - variable with parsing settings for makeprg command output
- [ ] :compiler - sets both makeprg and errorformat using pre-defined profile

### Search project-wide (grep etc.)

- [ ] :grep - use grep command, (accepts grep syntax not Vim's)
- [ ] grepprg, grepformat - control command used for :grep searches
- [ ] :vimgrep /.../ - use Vim native search engine
- [ ] :vimgrep /.../ ## - run vimgrep on each file in arguments list

### Autocompletion

- triggering:
  * [ ] <C-p>, <C-n> - generic keyword autocompletion
  * [ ] <C-x><C-n> - current buffer keywords
  * [ ] <C-x><C-i> - included file keywords
  * [ ] <C-x><C-]> - tag file keywords
  * [ ] <C-x><C-k> - dictionary lookup
  * [ ] <C-x><C-l> - whole line completition
  * [ ] <C-x><C-f> - filename completition
  * [ ] <C-x><C-o> - omni completition
  * [ ] <C-n><C-p> - summon the list but still allow to type (works with all types)
  * [ ] multiple times (e.g. <C-x><C-n> <C-x><C-n>...) - sequence of words
- interaction:
  * [ ] <C-p>, <C-n> - select and use previous/next match
  * [ ] <C-y> - use selected suggestion
  * [ ] <C-e> - do not use any suggestion and close autocompletion popup
  * [ ] <C-h> - remove one character from the current match
  * [ ] <C-l> - add one character from the current match
- [ ] completion - list of places to look up for generic autocompletion
- [ ] dictionary - list of dictionaries

### Spell checking

- [ ] :set spell - enable spellchecking
- [ ] :set spelllang - language for spellchecking, e.g.:
    * en_us
    * en_gb
- [ ] :set spellfile - list of files with additional spelling words
- [ ] [s, ]s - previous/next flag word (possible spelling mistake)
- [ ] z= - display correction suggestions for current flagged word
- [ ] <C-x><C-s> - display corrections for the closest flagged word in line
- [ ] [count] zg, zw - add/remove current word to/from spell file [spellfile #]
- [ ] zuw - revert zg/zw command for current word

Options
-------

- [ ] :set option? - check option value
- [ ] :set option! - toggle option
- [ ] :set option& - set default value
- [ ] :setlocal - set only for current window or buffer
- [ ] :bufdo setlocal, :windo setlocal - set for all buffers/windows

Plugins
-------

### Abolish
- [ ] :S/.../[Ivw] - search
- [ ] :S/.../.../[Ivw] - substitute
- [ ] :S/.../[Ivw] <files>... - grep
- [ ] cr(c|m|_|s|u|U|-|k|.| |t) - coerce current word

### CtrlP
- [ ] <C-d> - toggle between full-path and filename only search
- [ ] <S-Tab> - switch between results and input
- [ ] <C-]> - delete a character (like <C-h>)
- [ ] <C-z> - mark file for opening multiple files
- [ ] <C-o> - open multiple marked files
- [ ] <F7> - wipe MRU list, wipe marked MRU/buffer entries
