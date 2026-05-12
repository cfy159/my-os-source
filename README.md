# my-os-source

```shell
sudo apt-get install nasm
```

## bochs配置环境

resources/borchs-2.7.tar.gz，安装bochs2.7，因为我提供的代码中的bochs配置文件。

安装依赖

```shell
sudo apt-get install libx11-dev libc6-dev build-essential xorg-dev libgtk2.0-dev libreadline-dev
```

配置环境

```shell
./configure --with-x11 --with-x --enable-all-optimizations --enable-readline  --enable-debugger-gui --enable-x86-debugger --enable-a20-pin --enable-fast-function-calls --enable-debugger
```

安装

```shell
make -j4
sudo make install
```

配置环境

```shell
sudo apt install gcc-i686-linux-gnu
sudo apt install gdb

sudo apt install qemu-system qemu-utils gdb-multiarch
```

`bochsrc`启动配置见源码
