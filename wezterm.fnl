;; https://git.kempkens.io/daniel/dotfiles/src/commit/0409cbd84974ae716633645ef89e15ebeb949404/home/config/wezterm/config.fnl
;; https://wezterm.org/config/lua/config/index.html
(let [wezterm (require :wezterm)
      config (wezterm.config_builder)]

  (set config.font_size 15)
  (set config.font (wezterm.font "AdwaitaMono Nerd Font"))
  (set config.color_scheme "Gruvbox Dark (Gogh)")

  (set config.initial_cols 120)
  (set config.initial_rows 28)

  (set config.scrollback_lines 500000)

  (set config.use_fancy_tab_bar true)
  (set config.keys
       [{:key "("
         :mods "CTRL|SHIFT"
         :action (wezterm.action.SplitHorizontal
                  {:domain "CurrentPaneDomain"})}
        {:key ")"
         :mods "CTRL|SHIFT"
         :action (wezterm.action.SplitVertical
                  {:domain "CurrentPaneDomain"})}

        {:key "w"
         :mods "CTRL|SHIFT"
         :action (wezterm.action.CloseCurrentPane
                  {:confirm true})}])
  config)

;; Local Variables:
;; eval: (make-variable-buffer-local 'after-save-hook)
;; eval: (add-hook 'after-save-hook (lambda () (call-process  "bash" nil 0 nil "-c" "fennel --compile wezterm.fnl > wezterm.lua")) nil 'local)
;; End:
