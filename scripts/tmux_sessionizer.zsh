#!/usr/bin/env zsh

projects=(
          ~/.dotfiles
          ~/
        )

SELECTED=`print -l $projects | fzf --reverse`
FOLDER=$(basename $SELECTED) 
FOLDER=$(echo $FOLDER | tr "." "_")
IS_IN_GIT=`git -C $SELECTED rev-parse 3>/dev/null;echo $?`
SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')
SESSION=${SESSION//:/}

# Create a tmux session if doesn't exsist
if [[ -z "$SESSION" ]]; then
  echo "session does not exist"
  # -d : deattached mode, -s : new session, -c directory path where session opens
  tmux new-session -d -s $FOLDER -c $SELECTED;
  tmux new-window -t $FOLDER -c $SELECTED;
  if [ $IS_IN_GIT -eq 0 ]; then
    tmux new-window -t $FOLDER -c $SELECTED; 
  fi
fi

# Modify windows in created tmux session by sending commands
if [[ -z "$SESSION" ]]; then
  tmux send-keys -t $FOLDER:1 "nvim ." C-m
  # TODO : Run commands in in 2nd window, rebasing building etc
  if [ $IS_IN_GIT -eq 0 ]; then
    tmux send-keys -t $FOLDER:3 "lazygit" C-m
  fi
fi

# Attach to created tmux session
if [ -z "$TMUX" ]; then
  tmux attach -t $FOLDER
else
  tmux switch-client -t $FOLDER
fi
