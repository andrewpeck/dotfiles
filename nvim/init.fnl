;; Plugins
(do

  (local vim vim)
  (local Plug vim.fn.plug#)

  (vim.call :plug#begin)
  (fn Plugins [...]
    (icollect [_ p (ipairs [...])]
      (Plug p)))

  (Plugins :junegunn/seoul256.vim
           :SirVer/ultisnips
           :airblade/vim-gitgutter
           :godlygeek/tabular
           :junegunn/rainbow_parentheses.vim
           :junegunn/vim-peekaboo

           :justinmk/vim-gtfo
           :MTDL9/vim-log-highlighting
           :mbbill/undotree
           :scrooloose/nerdcommenter
           :thirtythreeforty/lessspace.vim
           :vim-scripts/a.vim             ; A to switch between .c and .h
           :vim-scripts/taglist.vim
           :w0rp/ale

           ;; Better % and * matching
           :tmhedberg/matchit
           :andymass/vim-matchup

           ;;Airline
           :vim-airline/vim-airline
           :vim-airline/vim-airline-themes

           ;; Conflict Motions
           :vim-scripts/ConflictMotions   ; ConflictMotions
           :vim-scripts/CountJump         ;    needed by ConflictMotions
           :vim-scripts/ingo-library      ; needed by ConflictMotions

           ;; Tim Pope
           :tpope/vim-eunuch
           :tpope/vim-fugitive
           :tpope/vim-repeat
           :tpope/vim-surround
           :tpope/vim-vinegar
           :tpope/vim-abolish

           ;; Languages
           :vhda/verilog_systemverilog.vim
           :vim-scripts/VIP ;; Special copy paste for VHDL
           :lervag/vimtex
           :JuliaEditorSupport/julia-vim
           :gabrielelana/vim-markdown
           :jceb/vim-orgmode

           ;; Colorschemes
           :NLKNguyen/papercolor-theme
           :chriskempson/base16-vim
           :dmcgrady/vim-lucario
           :dracula/vim
           :guns/jellyx.vim
           :zeis/vim-kolor
           :lifepillar/vim-solarized8
           :morhetz/gruvbox
           :patstockwell/vim-monokai-tasty
           :iCyMind/NeoSolarized

           :liuchengxu/vim-which-key
           )

  ;; FZF
  (Plug :junegunn/fzf {:do #(vim.fn.fzf#install)})
  (Plug :junegunn/fzf.vim)
  (Plug :pbogut/fzf-mru.vim)

  (vim.call :plug#end))

;; Keybindings
(do

  (set vim.g.mapleader  " ")

  (macro bind [key command options]
    (let [mode (or  (and options (. options :mode)) :n)
          opts (or  (and options (. options :opts)) {:noremap true :silent true})]
      `(vim.api.nvim_set_keymap
        ,mode
        ,key
        ,command
        ,opts)))

  (bind :<leader>   ":WhichKey '<Space>'<CR>")
  (bind :<leader>tt ":Tags<CR>")
  (bind :<leader>f  ":Files")
  (bind :<leader>rr ":FZFMru<CR>")
  (bind :<leader>rg ":Rg<CR>")
  (bind :<leader>b  ":Buffers<CR>")

  (bind :<leader>g  ":GGrep<CR>")
  (bind :<leader>gg ":Gstatus<CR>")
  (bind :<leader>gS ":Gwrite<CR>")
  (bind :<C-p>      ":GFiles<CR>")

  (bind :<leader>bb ":!~/bin/vhdl-beautify %<CR>")

  (bind :<leader>fr ":FZFMru<CR>")
  (bind :<leader>b  ":Buffers<CR>")
  (bind :<leader>fp ":Files ~/.dotfiles<CR>")

  (bind :<A-x> ":Commands<CR>")

  ;; (bind :n :q "vipgq" :opts {:noremap true :silent true})
  ;; (bind :v :q "vipgq" :opts {:noremap true :silent true})

  (bind :C-o ":Files ~/<CR>")
  (bind :C-n ":Files ~/notes<CR>")

  (bind :Y "y$"))

;;------------------------------------------------------------------------------
;; Editor Config
;;------------------------------------------------------------------------------

(do
  ;; appearance
  (vim.cmd "colorscheme gruvbox")

  ;; tabs & spaces
  (set vim.g.tabstop 2)
  (set vim.g.shiftwidth 2)
  (set vim.g.softtabstop 2)
  (set vim.g.expandtab 2)
  (set vim.g.shiftround t)

  (set vim.g.linebreak t)
  (set vim.g.nolist t)
  (set vim.g.wrapmargin 0)

  (vim.opt.formatoptions:remove :t)

  ;; search
  (set vim.g.showmatch t)
  (set vim.g.matchtime 3)
  (set vim.g.incsearch t)
  (set vim.g.hlsearch t)
  (set vim.g.ignorecase t)
  (set vim.g.smartcase t))


;; """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
;; " Change Backup File behavor
;; """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

;; " n.b. For Unix and Win32, if a directory ends in two path separators, the swap
;; " file name will be built from the complete path to the file with all path
;; " separators substituted to percent '%' signs. This will ensure file name
;; " uniqueness in the preserve directory.

;; if has("win32")
;;   set directory=c:\\vimtmp\\
;;   set backupdir=c:\\vimtmp\\
;; else
;;   set directory=$HOME/.vim/tmp//
;;   set backupdir=$HOME/.vim/tmp//
;; endif

;; if !isdirectory(&backupdir)
;;   call mkdir(&backupdir, 'p')  " 'p' flag creates parent directories if needed
;; endif

true

;; Local Variables:
;; eval: (make-variable-buffer-local 'after-save-hook)
;; eval: (add-hook 'after-save-hook (lambda () (call-process  "bash" nil 0 nil "-c" "fennel --compile init.fnl > init.lua")) nil 'local)
;; End:
