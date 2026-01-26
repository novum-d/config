while [[ $(/opt/homebrew/bin/brew list | wc -l) -ne 0 ]]; do
  for EACH in $(/opt/homebrew/bin/brew list); do
    /opt/homebrew/bin/brew uninstall --force --ignore-dependencies $EACH
  done
done
