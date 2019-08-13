# Build ARM tool chain inside containers
Have a look at [ARM Developer](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm).

## [WIP] Usage

Keep in mind: This is a work in progress.

The image is currently based on `ubuntu`.
Further testing has to be done.

Running the container will result in a newly compiled arm toolchain, provided
you mounted a local directory as `arm-toolchain` inside the container.

### Building the container
You need the `Source Invariant` package from [GNU Arm Embedded Toolchain][1] in your container build drectory.
The package released in July 10 2019 has the name `gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2`. 

```
# SOURCE_PACKAGE is the name of your `Source Invariant` package
podman build \
         --build-arg SOURCE_PACKAGE=gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2 \
		 --tag arm_toolchain:latest .
```

### Running
```
# run the container while mounting `/arm-toolchain` to a local directory.
mkdir -p ./arm
podman run -ti -v $(pwd)/arm:/arm-toolchain arm_toolchain:latest

# After the container (sucessfully) exit, you can find the toolchain in the
# directory you mounted inside the container.
```
[1]: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
