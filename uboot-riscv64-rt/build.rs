use std::{env, fs, path::PathBuf};

fn main() {
	let output = PathBuf::from(env::var("OUT_DIR").unwrap());

	fs::write(output.join("memory.x"), include_bytes!("layout.ld")).unwrap();

	println!("cargo:rustc-link-search={}", output.display());

	println!("cargo:rerun-if-changed=layout.ld");
	println!("cargo:rerun-if-changed=build.rs");
}
