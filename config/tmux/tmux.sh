tbtm () {
  if ! tmux has-session -t $1; then
  tmux new -s $1 -d
    tmux split-window -t $1:1 -v -p 15
    tmux send-keys -t $1:1.0 vim Enter
    tmux send-keys -t $1:1.1 \
      npm run dev Enter
  fi
  tmux attach -t $1
}
