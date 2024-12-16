# Initialize Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add versionless Python binaries to PATH
export PATH="$(brew --prefix python)/libexec/bin:$PATH"