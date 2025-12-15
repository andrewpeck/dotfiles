{ config, pkgs, callPackage, ... }: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "apeck";
  home.homeDirectory = "/home/apeck";

  home.extraOutputsToInstall = [ "dev" "lib" ];

  # You should not change this value
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Packages
  home.packages = [
    pkgs.pass
    pkgs.wordnet
    pkgs.tesseract4
    pkgs.dmenu
    #pkgs.xss-lock
    # pkgs.parcellite
    pkgs.xautolock
    pkgs.flameshot
    # pkgs.alttab
    pkgs.rofi
    pkgs.imgcat
    pkgs.neovim
    #fennel
    pkgs.lua5_4
    pkgs.lua54Packages.fennel
    pkgs.lua-language-server
    # nix
    pkgs.nix-search-cli
    pkgs.nixfmt-classic
    pkgs.nil
    # pkgs.xclip # org download
    pkgs.xorg.xwininfo # emacs everywhere
    pkgs.xdotool # emacs everywhere
    #utils
    pkgs.babelfish
    pkgs.borgbackup
    pkgs.borgmatic
    pkgs.glow
    pkgs.restic
    pkgs.shellcheck
    pkgs.alacritty
    pkgs.xcalib
    # pkgs.xbindkeys
    pkgs.fzf
    pkgs.rare-regex
    pkgs.isync
    # Source locally installed gems is ignoring #<Bundler::StubSpecification name=rbs version=3.4.0 platform=ruby> because it is missing extensions
    # pkgs.youplot
    pkgs.jq
    pkgs.yq
    pkgs.lesspipe
    pkgs.tmux
    pkgs.fd
    pkgs.silver-searcher
    pkgs.bat
    pkgs.lynx
    pkgs.ripgrep
    pkgs.neomutt
    pkgs.gnuplot
    pkgs.yamllint
    pkgs.markdownlint-cli
    pkgs.pandoc
    # https://mynixos.com/nixpkgs/packages/nerd-fonts
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.adwaita-mono
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts._3270
    pkgs.nerd-fonts.inconsolata-go
    pkgs.nerd-fonts.terminess-ttf
    pkgs.courier-prime
    pkgs.rlwrap
    pkgs.python312Packages.grip
    #tcl
    pkgs.nagelfar
    #c/c++
    pkgs.bear
    #pkgs.ccls
    #clojure
    pkgs.babashka
    pkgs.clj-kondo
    pkgs.clojure-lsp
    # python
    pkgs.python312Packages.pyflakes
    pkgs.python312Packages.pyment
    pkgs.python312Packages.jupytext
    pkgs.python312Packages.pylint-venv
    pkgs.pylint
    pkgs.uv
    pkgs.basedpyright
    pkgs.ruff
    pkgs.python312Packages.autopep8
    pkgs.isort
    pkgs.cloc
    # hdl
    pkgs.gtkwave
    # tex
    pkgs.texlivePackages.digestif
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    ".config/autorandr".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/autorandr;

    ".config/picom/picom.conf".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/picom.conf;
    ".config/i3/config".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/i3-config;
    ".config/i3status/i3status.conf".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/i3-status;
    ".config/sway/config".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/i3-config;
    ".config/rofi/config.rasi".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/rofi-config.rasi;

    ".config/git/ignore".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/gitignore;
    ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/gitconfig;
    ".gitattributes".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/gitattributes;

    ".sbclrc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/sbclrc;

    # vim
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/nvim;
    #".vimrc".source = ~/dotfiles/vim/vimrc;
    ".vim/autoload/plug.vim".source = ~/dotfiles/vim/vim/autoload/plug.vim;
    ".vim/UltiSnips".source = ~/dotfiles/vim/vim/UltiSnips;
    ".vim/colors".source = ~/dotfiles/vim/vim/colors;

    # tools
    ".tclsyntaxdb".source = ~/dotfiles/syntaxdb86.tcl;
    ".aspell.en.pws".source = ~/dotfiles/aspell.en.pws;
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/bashrc;
    ".conkyrc".source = ~/dotfiles/conkyrc;
    ".fdignore".source = ~/dotfiles/fdignore;
    ".screenrc".source = ~/dotfiles/screenrc;
    ".tmux.conf".source = ~/dotfiles/tmux.conf;
    ".proselintrc".source = ~/dotfiles/proselintrc;
    ".mdlrc".source = ~/dotfiles/markdownlint-config.yml;
    ".config/ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/ghostty-config;
    ".wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/wezterm.lua;
    ".local/share/applications/org-protocol.desktop".source = ~/dotfiles/org-protocol.desktop;

    #mutable configs
    ".config/solaar/config.yaml".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/solaar-config.yaml;
    ".config/xournalpp/settings.xml".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/xournal-settings.xml;
    ".config/spectaclerc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/spectaclerc;
    ".config/dolphinrc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/dolphinrc;
    ".local/share/konsole".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/konsole;

    #mutt
    ".mailcap".source = ~/dotfiles/mailcap;
    ".mutt".source = ~/dotfiles/mutt;
    ".mbsyncrc".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/mbsyncrc;

    #python
    ".config/pycodestyle".source = ~/dotfiles/pycodestyle;
    ".pylintrc".source = ~/dotfiles/pylintrc;
    ".flake8rc".source = ~/dotfiles/flake8rc;
    ".pdbrc".source = ~/dotfiles/pdbrc;
    ".mypy.ini".source = ~/dotfiles/mypy.ini;
    ".ruff.toml".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/ruff.toml;

    # x/shell
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/fish;
    ".profile".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/profile;
    # ".xbindkeysrc".source = ~/dotfiles/xbindkeysrc;
    #".xinitrc".source = ~/dotfiles/xinitrc;
    ".Xresources".source = ~/dotfiles/Xresources;

    # mpd
    ".mpd/mpd.conf".source = ~/dotfiles/mpd/mpd.conf;
    ".ncmpcpp/config".source = ~/dotfiles/ncmpcpp/config;

    # snes9x for flatpak
    # add /nix/store permissions in flatseal
    ".var/app/com.snes9x.Snes9x/config/snes9x/snes9x.conf".source = config.lib.file.mkOutOfStoreSymlink ~/dotfiles/snes9x.conf;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  fonts.fontconfig.enable = true;

  # Home Manager can also manage your environment variables through 'home.sessionVariables'
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "vim";
    LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
  };

  programs.lesspipe.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #-------------------------------------------------------------------------------
  # systemd services
  #-------------------------------------------------------------------------------
  # services.emacs.enable = true;

  # systemd.user.services.xbindkeys = {
  #   Unit = {Description = "xbindkeys";};
  #   Install = {WantedBy = [ "default.target" ];};
  #   Service = {
  #       Type = "simple";
  #       # ExecStart = "${pkgs.xbindkeys}/bin/xbindkeys";
  #       ExecStart = "${pkgs.writeShellScript "xbindkeys" ''${pkgs.xbindkeys}/bin/xbindkeys -n''}";
  #       Environment = "PATH=${builtins.getEnv("HOME")}/.nix-profile/bin/:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin";
  #       Restart = "on-failure";
  #       SuccessExitStatus="15";
  #   };
  # };
}
