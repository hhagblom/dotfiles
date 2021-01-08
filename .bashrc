[ -n "$PS1" ] && source ~/.bash_profile;

# added by travis gem
[ -f /home/hapeha/.travis/travis.sh ] && source /home/hapeha/.travis/travis.sh

complete -C /usr/local/bin/terraform terraform
