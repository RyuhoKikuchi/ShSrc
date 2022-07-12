defaults write com.apple.finder CreateDesktop -int $((1!=$(defaults read com.apple.finder CreateDesktop -int))); killAll Finder
