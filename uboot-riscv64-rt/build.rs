use std::{env, fs, path::PathBuf};

fn main() {
	let outputs = PathBuf::from(env::var("OUT_DIR").unwrap());

	fs::write(outputs.join("kernel.ld"), include_bytes!("kernel.ld")).unwrap();
	println!("cargo:rerun-if-changed=kernel.ld");

	#[cfg(feature = "qemu-rv64-virt")]
	fs::write(
		outputs.join("layout.ld"),
		include_bytes!("qemu_rv64_virt/layout.ld"),
	)
	.unwrap();
	println!("cargo:rerun-if-changed=qemu_rv64_virt/layout.ld");

	println!("cargo:rustc-link-search={}", outputs.display());
	println!("cargo:rerun-if-changed=build.rs");
}
