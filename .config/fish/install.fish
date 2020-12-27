mkdir -p "$HOME/.config/fish" || true
ln -sf "$PWD/config.fish" "$HOME/.config/fish/config.fish"

if not test -e "$HOME/.config/fish/functions/fisher.fish"
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

fisher install \
  lukasjoc/fishforawhile \
  jorgebucaran/nvm.fish

fisher list
