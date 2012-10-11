# ~/.bash_profile for MEET 

# git
export GIT_AUTHOR_NAME=`getent passwd "$USER" | cut -d: -f5`
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export EMAIL="$USER@meet.mit.edu"

# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
