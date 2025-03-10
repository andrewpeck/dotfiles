## AutoVenv Settings
if status is-interactive
  test -z "$autovenv_announce"
  and set -g autovenv_announce "yes"
  test -z "$autovenv_enable"
  and set -g autovenv_enable "yes"
  test -z "$autovenv_dir"
  and set -g autovenv_dir ".venv"
end

# Apply autovenv settings.
function applyAutoenv
  # Check for the enable flag and make sure we're running interactive, if not return.
  test ! "$autovenv_enable" = "yes"
  or not status is-interactive
  and return
  # We start by splitting our CWD path into individual elements and iterating over each element.
  # If our CWD is `/opt/my/hovercraft/eels` we split it into a variable containing 4 entries:
  # `opt`, `my`, `hovercraft` and `eels`. We then iterate over each entry and check to see if it
  # contains a `bin/activate.fish` file. If a venv is found we go ahead and break out of the loop,
  # otherwise continue. We go through all of this instead of just checking the CWD to handle cases
  # where the user moves into a sub-directory of the venv.
  set _tree (pwd)
  while test $_tree != "/"
    set -l _activate (string join '/' "$_tree" "$autovenv_dir" "bin/activate.fish")
    set -l _activate (string replace -a "//" "/" "$_activate")

    if test -e "$_activate"
      set _source "$_activate"
      if test "$autovenv_announce" = "yes"
        set -g __autovenv_old $__autovenv_new
        set -g __autovenv_new (basename $_tree)
      end
      break
    end


    set _tree (dirname $_tree)
  end
  # If we're *not* in an active venv and the venv source dir exists we activate it and return.
  if test -z "$VIRTUAL_ENV" -a -e "$_source"
    source "$_source"
    if test "$autovenv_announce" = "yes"
      echo "Activated Virtual Environment ($__autovenv_new)"
    end
    # Next we check to see if we're already in an active venv. If so we proceed with further tests.
  else if test -n "$VIRTUAL_ENV"
    # Check to see if our CWD is inside the venv directory.
    set _dir (string match -n "$VIRTUAL_ENV*" "$_source")
    # If we're no longer inside the venv dirctory deactivate it and return.
    if test -z "$_dir" -a ! -e "$_source"
      if type -q "deactivate"
        deactivate
      end
      if test "$autovenv_announce" = "yes"
        echo "Deactivated Virtual Enviroment ($__autovenv_new)"
        set -e __autovenv_new
        set -e __autovenv_old
      end
      # end
      # If we've switched into a different venv directory, deactivate the old and activate the new.
    else if test -z "$_dir" -a -e "$_source"
      if type -q "deactivate"
        deactivate
      end
      source "$_source"
      if test "$autovenv_announce" = "yes"
        echo "Switched Virtual Environments ($__autovenv_old => $__autovenv_new)"
      end
      # end
    end
  end
end

# We need to run AutoVenv on the initialization of each session.
if status is-interactive
  applyAutoenv
end

## AutoVenv Function.
# Activates on directory changes.
function autovenv --on-variable PWD -d "Automatic activation of Python virtual environments"
  applyAutoenv
end
