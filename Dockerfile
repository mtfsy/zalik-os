FROM ubuntu:24.04 
#FROM alpine:3.23.3

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

COPY zalik-os .

RUN apt-get update && apt-get install -y \
    qemu-system-misc \
    build-essential \
    wget

#RUN curl -o /app/xpack-qemu-riscv-8.2.2-1-linux-x64.tar.gz https://github.com/xpack-dev-tools/qemu-riscv-xpack/releases/download/v8.2.2-1/xpack-qemu-riscv-8.2.2-1-linux-x64.tar.gz 

#RUN tar -zxf /app/xpack-qemu-riscv-8.2.2-1-linux-x64.tar.gz

RUN wget -O /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v14.2.0-3/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz 

RUN tar -zxf /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz

#RUN export PATH="$PATH:/app/xpack-qemu-riscv-8.2.2-1-linux-x64/bin"

#ENV PATH="/app/xpack-qemu-riscv-8.2.2-1-linux-x64/bin:${PATH}"

#ENV PATH="/app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64/bin:{$PATH}"
#RUN ln -s /app/xpack-qemu-riscv-8.2.2-1-linux-x64/bin/* /bin/riscv-none-elf-gcc

RUN ln -s /app/xpack-riscv-none-elf-gcc-14.2.0-3/bin/* /usr/bin

RUN rm /app/xpack-riscv-none-elf-gcc-14.2.0-3-linux-x64.tar.gz

ENTRYPOINT ["make", "qemu"]
