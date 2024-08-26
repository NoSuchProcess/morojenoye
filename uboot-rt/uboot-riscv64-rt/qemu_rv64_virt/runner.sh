qemu-system-riscv64 -machine virt -cpu rv64 -m 128M \
-nographic -bios default -kernel result/riscv64/u-boot.bin \
-device loader,file=$1,addr=0x82000000,force-raw=on -s
