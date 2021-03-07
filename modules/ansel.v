module modules
import os

[unsafe]
fn python(file string) ?os.Result {
	$if windows {
		return os.exec('py $file')
	}
	return os.exec('python $file')
}

pub fn run_api() ? {
	for {
		unsafe {
			python('./api.py') or { panic(err) }
			print("Ok.")
			break
		}
	}
}
