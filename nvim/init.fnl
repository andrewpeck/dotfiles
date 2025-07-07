;; Plugins
(do
  (local vim vim)
  (local Plug vim.fn.plug#)

  (vim.call "plug#begin")

  (Plug "junegunn/seoul256.vim")
  (Plug "SirVer/ultisnips")
  (Plug "airblade/vim-gitgutter")
  (Plug "godlygeek/tabular")
  (Plug "junegunn/rainbow_parentheses.vim")
  (Plug "junegunn/vim-peekaboo")

  ;; (local plugins ["apple" "banana" "cherry"])
  ;; (each [plug (pairs plugins)]
  ;;   (print plug))

  (Plug "justinmk/vim-gtfo")
  (Plug "MTDL9/vim-log-highlighting")
  (Plug "mbbill/undotree")
  (Plug "scrooloose/nerdcommenter")
  (Plug "thirtythreeforty/lessspace.vim")
  (Plug "vim-scripts/a.vim")            ; A to switch between .c and .h
  (Plug "vim-scripts/taglist.vim")
  (Plug "w0rp/ale")

  ;; Better % and * matching
  (Plug "tmhedberg/matchit")
  (Plug "andymass/vim-matchup")

  ;;Airline
  (Plug "vim-airline/vim-airline")
  (Plug "vim-airline/vim-airline-themes")

  ;; Conflict Motions
  (Plug "vim-scripts/ConflictMotions")  ; ConflictMotions
  (Plug "vim-scripts/CountJump")        ;    needed by ConflictMotions
  (Plug "vim-scripts/ingo-library")     ; needed by ConflictMotions

  ;; FZF
  (Plug "junegunn/fzf" {:do #(vim.fn.fzf#install)})
  (Plug "junegunn/fzf.vim")
  (Plug "pbogut/fzf-mru.vim")

  ;; Tim Pope
  (Plug "tpope/vim-eunuch")
  (Plug "tpope/vim-fugitive")
  (Plug "tpope/vim-repeat")
  (Plug "tpope/vim-surround")
  (Plug "tpope/vim-vinegar")
  (Plug "tpope/vim-abolish")

  ;; Languages
  (Plug "vhda/verilog_systemverilog.vim")
  (Plug "vim-scripts/VIP") ;; Special copy paste for VHDL
  (Plug "lervag/vimtex")
  (Plug "JuliaEditorSupport/julia-vim")
  (Plug "gabrielelana/vim-markdown")
  (Plug "jceb/vim-orgmode")

  ;; Colorschemes
  (Plug "NLKNguyen/papercolor-theme")
  (Plug "chriskempson/base16-vim")
  (Plug "dmcgrady/vim-lucario")
  (Plug "dracula/vim")
  (Plug "guns/jellyx.vim")
  (Plug "zeis/vim-kolor")
  (Plug "lifepillar/vim-solarized8")
  (Plug "morhetz/gruvbox")
  (Plug "patstockwell/vim-monokai-tasty")
  (Plug "iCyMind/NeoSolarized")

  (Plug "liuchengxu/vim-which-key")
  (vim.call "plug#end"))

;; Keybindings
(do
  (vim.api.nvim_set_keymap "n" "<leader>" ":WhichKey '<Space>'<CR>" {:noremap true :silent true}))


true

;; Local Variables:
;; eval: (make-variable-buffer-local 'after-save-hook)
;; eval: (add-hook 'after-save-hook (lambda () (call-process  "bash" nil 0 nil "-c" "fennel --compile init.fnl > init.lua")) nil 'local)
;; End:
