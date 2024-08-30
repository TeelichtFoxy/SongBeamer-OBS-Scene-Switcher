import os
import time

file_path = "C:/ES-OBS-Script-Dateien/songbeamertextoutput.txt"
truefile_path = "C:/ES-OBS-Script-Dateien/sboutput.txt"

print("Überprüfung wird gestartet. Fahre fort mit OBS.")

while True:
    print("TEST")
    if os.path.exists(file_path):
        print("File Exist:", file_path)
        with open(file_path, "r") as f:
            print("Opened File:", file_path)
            if any(c.isalpha() for c in f.read()):
                print("Read File:", file_path)
                if os.path.exists(truefile_path) != True:
                    with open(truefile_path, "w") as truefile:
                        truefile.write("true")
                    print("Text Output - File created:", truefile_path)
                else:
                    print("No changes...")
            else:
                print("Read File:", file_path)
                if os.path.exists(truefile_path):
                    os.remove(truefile_path)
                    print("No Text Output - File deleted:", truefile_path)
                else:
                    print("No changes...")
    time.sleep(1)