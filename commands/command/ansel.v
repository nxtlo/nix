module command
import time
import os

const path = "./lib/guro.cpp"

[unsafe]
fn cpp(file string) ?os.Result {
	$if windows {
		return os.execute_or_panic("g++ $file")
	}
	return os.execute("g++ $file")
}

fn with_blocks(lang string, code string) string {
	return "```$lang\n$code\n```"
}

pub fn show_file() string {
	mut file := os.read_file(path) or { error("No.") }
	return with_blocks("cpp", file)
}

pub fn from_cpp() ? {
	for {
		unsafe {
			cpp(path)?
			time.sleep(2)
			print("Ok.")
			break
		}
	}
}
