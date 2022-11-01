#!/bin/bash

set -e
set -x

original_dir=$PWD
cd "$1"
. dependencies.sh
cd "$original_dir"

set +e
has_git="$(command -v git)"
has_cargo="$(command -v ~/.cargo/bin/cargo)"
has_sudo="$(command -v sudo)"
has_grep="$(command -v grep)"
has_youtubedl="$(command -v youtube-dl)"
has_pip3="$(command -v pip3)"
set -e

dpkg --add-architecture i386
apt update
apt install -y build-essential g++-multilib gcc-multilib libz-dev:i386 libc6:i386 libc6 nodejs

if ! [ -x "$has_cargo" ]; then
	echo "Installing rust..."
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	. ~/.profile
fi

if ! ( [ -x "$has_git" ] && [ -x "$has_grep" ] && [ -f "/usr/lib/i386-linux-gnu/libssl.so" ] ); then
	echo "Installing apt dependencies..."
	if ! [ -x "$has_sudo" ]; then
		dpkg --add-architecture i386
		apt-get update
		apt-get install -y git lib32z1 pkg-config libssl-dev:i386 libssl-dev libssl1.1:i386
		rm -rf /var/lib/apt/lists/*
	else
		sudo dpkg --add-architecture i386
		sudo apt-get update
		sudo apt-get install -y git lib32z1 pkg-config libssl-dev:i386 libssl-dev libssl1.1:i386
		sudo rm -rf /var/lib/apt/lists/*
	fi
fi

if [ ! -d "rust-g" ]; then
	echo "Cloning rust-g..."
	git clone https://github.com/tgstation/rust-g
	cd rust-g
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
	cd ..
else
	echo "Fetching rust-g..."
	cd rust-g
	git fetch
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
	cd ..
fi

if [ ! -d "auxmos" ]; then
	echo "Cloning auxmos..."
	git clone https://github.com/Putnam3145/auxmos
	cd auxmos
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
	cd ..
else
	echo "Fetching auxmos..."
	cd auxmos
	git fetch
	~/.cargo/bin/rustup target add i686-unknown-linux-gnu
	cd ..
fi

echo "Deploying rust-g..."
cd rust-g
git checkout "$RUST_G_VERSION"
env PKG_CONFIG_ALLOW_CROSS=1 RUSTFLAGS="-C target-cpu=native --cfg procmacro2_semver_exempt" ~/.cargo/bin/cargo build --release --target=i686-unknown-linux-gnu
if [ -f "$1/librust_g.so" ]; then
	rm "$1/librust_g.so"
fi
mv target/i686-unknown-linux-gnu/release/librust_g.so "$1/librust_g.so"
cd ..

echo "Deploying auxmos..."
cd auxmos
git checkout "v$AUXMOS_VERSION"
env PKG_CONFIG_ALLOW_CROSS=1 RUSTFLAGS="-C target-cpu=native" ~/.cargo/bin/cargo rustc --release --target=i686-unknown-linux-gnu --features "all_reaction_hooks,katmos" -- -C target_cpu=native
if [ -f "$1/libauxmos.so" ]; then
	rm "$1/libauxmos.so"
fi
mv target/i686-unknown-linux-gnu/release/libauxmos.so "$1/libauxmos.so"
cd ..

if ! [ -x "$has_youtubedl" ]; then
	echo "Installing youtube-dl with pip3..."
	if ! [ -x "$has_sudo" ]; then
		apt-get install -y python3 python3-pip
	else
		sudo apt-get install -y python3 python3-pip
	fi
	pip3 install youtube-dl
elif [ -x "$has_pip3" ]; then
	echo "Ensuring youtube-dl is up-to-date with pip3..."
	pip3 install youtube-dl -U
fi

echo "Compiling tgui..."
cd "$1"
chmod +x $1/tgui/bin/tgui
$1/tgui/bin/tgui
