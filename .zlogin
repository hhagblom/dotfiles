echo ".zlogin (start)"
keychain $HOME/.ssh/eletive
keychain $HOME/.ssh/id_ed25519

source $HOME/.keychain/$HOST-sh

# Used for debugging purposes
# echo "PATH=$PATH"

echo ".zlogin processed"
