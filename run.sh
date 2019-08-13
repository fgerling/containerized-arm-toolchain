set -e
export PREFIX=/arm-toolchain
export PATH=$PREFIX/bin:$PATH

TAR_FILE="gcc-arm-none-eabi-src.tar.bz2"
root_dir=$(pwd)

#Untar the source tarball.
tar --extract \
	--bzip2 \
	--strip-components 1 \
	--file "$TAR_FILE" \
	--directory "$PREFIX" 
cd "$PREFIX"
./install-sources.sh --skip_steps=mingw32
#Build the toolchain(s).
./build-prerequisites.sh --skip_steps=mingw32
./build-toolchain.sh --skip_steps=mingw32
