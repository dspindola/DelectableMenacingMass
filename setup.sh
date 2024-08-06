#!/bin/sh

source ~/.bashrc

proto upgrade && source ~/.bashrc

mkdir -p ./.config/.proto

echo """[plugins]
biome = \"https://raw.githubusercontent.com/Phault/proto-toml-plugins/main/biome/plugin.toml\"
just = \"https://raw.githubusercontent.com/Phault/proto-toml-plugins/main/just/plugin.toml\"
oxlint = \"https://raw.githubusercontent.com/Phault/proto-toml-plugins/main/oxlint/plugin.toml\"
yq = \"https://raw.githubusercontent.com/appthrust/proto-toml-plugins/main/yq/plugin.toml\"
zellij = \"https://raw.githubusercontent.com/appthrust/proto-toml-plugins/main/zellij/plugin.toml\"
gh = \"https://raw.githubusercontent.com/appthrust/proto-toml-plugins/main/gh/plugin.toml\"
""" > ./.config/.proto/.prototools

proto install biome
proto install just
proto install oxlint
proto install bun
proto install node

touch .prototools

proto pin biome latest
proto pin just latest
proto pin oxlint latest
proto pin bun latest
proto pin node latest

bun pm -g bin

bun install --global bun-types

touch "$XDG_CONFIG_HOME/.bunfig.toml"

