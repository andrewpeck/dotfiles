function sai --wraps='sudo apt install' --description 'alias sai=sudo apt install'
  sudo apt install $argv
end
