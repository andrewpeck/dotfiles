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
    # nix
    pkgs.nix-search-cli
    pkgs.nixfmt-classic
    pkgs.nil
    #emacs
    pkgs.emacs30
    pkgs.emacs-lsp-booster
    pkgs.tree-sitter
    pkgs.xclip # org download
    pkgs.xorg.xwininfo # emacs everywhere
    pkgs.xdotool # emacs everywhere
    #utils
    pkgs.gcc
    pkgs.glibc
    pkgs.zlib
    pkgs.borgbackup
    pkgs.borgmatic
    pkgs.restic
    pkgs.shellcheck
    pkgs.xcalib
    pkgs.xbindkeys
    pkgs.fzf
    pkgs.rare-regex
    pkgs.isync
    pkgs.youplot
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
    pkgs.grip
    pkgs.rlwrap
    #tcl
    pkgs.nagelfar
    pkgs.tcl
    #c/c++
    pkgs.bear
    pkgs.ccls
    #clojure
    pkgs.babashka
    pkgs.clj-kondo
    pkgs.clojure-lsp
    # python
    pkgs.python312Packages.pyflakes
    pkgs.python312Packages.pyment
    pkgs.python312Packages.pytest
    pkgs.python312Packages.jupytext
    pkgs.pylint
    pkgs.pyright
    pkgs.mypy
    pkgs.ruff
    pkgs.python312Packages.autopep8
    pkgs.isort
    # hdl
    pkgs.verilator
    pkgs.ghdl-llvm
    pkgs.gtkwave
    # tex
    pkgs.texlivePackages.digestif
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    ".config/git/ignore".source = ~/dotfiles/gitignore;
    ".gitconfig".source = ~/dotfiles/gitconfig;

    # vim
    ".vimrc".source = ~/dotfiles/vim/vimrc;
    ".vim/autoload/plug.vim".source = ~/dotfiles/vim/vim/autoload/plug.vim;
    ".vim/UltiSnips".source = ~/dotfiles/vim/vim/UltiSnips;
    ".vim/colors".source = ~/dotfiles/vim/vim/colors;

    # tools
    ".aspell.en.pws".source = ~/dotfiles/aspell.en.pws;
    ".bashrc".source = ~/dotfiles/bashrc;
    ".conkyrc".source = ~/dotfiles/conkyrc;
    ".fdignore".source = ~/dotfiles/fdignore;
    ".screenrc".source = ~/dotfiles/screenrc;
    ".tmux.conf".source = ~/dotfiles/tmux.conf;
    ".proselintrc".source = ~/dotfiles/proselintrc;
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
    ".mbsyncrc".source = ~/dotfiles/mbsyncrc;

    #python
    ".config/pycodestyle".source = ~/dotfiles/pycodestyle;
    ".pylintrc".source = ~/dotfiles/pylintrc;
    ".flake8rc".source = ~/dotfiles/flake8rc;
    ".pdbrc".source = ~/dotfiles/pdbrc;
    ".mypy.ini".source = ~/dotfiles/mypy.ini;

    # x/shell
    ".config/fish".source = ~/dotfiles/fish;
    ".profile".source = ~/dotfiles/profile;
    ".xbindkeysrc".source = ~/dotfiles/xbindkeysrc;
    ".xinitrc".source = ~/dotfiles/xinitrc;

    # mpd
    ".mpd/mpd.conf".source = ~/dotfiles/mpd/mpd.conf;
    ".ncmpcpp/config".source = ~/dotfiles/ncmpcpp/config;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

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
  services.emacs.enable = true;

  systemd.user.services.xbindkeys = {
    Unit = {Description = "xbindkeys";};
    Install = {WantedBy = [ "default.target" ];};
    Service = {
        Type = "simple";
        # ExecStart = "${pkgs.xbindkeys}/bin/xbindkeys";
        ExecStart = "${pkgs.writeShellScript "xbindkeys" ''${pkgs.xbindkeys}/bin/xbindkeys -n''}";
        Environment = "PATH=${builtins.getEnv("HOME")}/.nix-profile/bin/:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin";
        Restart = "on-failure";
        SuccessExitStatus="15";
    };
  };
}
