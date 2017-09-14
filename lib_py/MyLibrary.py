import subprocess
import os

def hello(name):
    print "Hello, %s !" % name

def do_nothing():
    pass

def check_text_in_file(file_path, text):
    with open(os.path.join("../../../../../", file_path), 'r') as file:
        for line in file:
            if text in line:
                return 0
    file.close()
    raise AssertionError('No matching text found')

def clear_file(file_path):
    subprocess.call("> %s" % os.path.join("../../../../../", file_path), shell=True)
