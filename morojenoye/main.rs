#![no_std]
#![no_main]

use core::panic::PanicInfo;
use uboot_riscv64_rt::entry;

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
	loop {}
}

#[entry]
fn main() -> ! {
	loop {}
}
