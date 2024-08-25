#![no_std]
cfg_if::cfg_if! {
	if #[cfg(feature = "qemu-rv64-virt")] {
		mod qemu_rv64_virt;
	}
}
