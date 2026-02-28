FROM ubuntu:24.04 

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY zalik-os .

RUN apt-get update && apt-get install -y \
    qemu-system-misc \
    build-essential \
    wget

RUN wget -O /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v14.2.0-3/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz 

RUN tar -zxf /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz

RUN ln -s /app/xpack-riscv-none-elf-gcc-14.2.0-3/bin/* /usr/bin

RUN rm /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz

ENTRYPOINT ["make", "qemu"]
