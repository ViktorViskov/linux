#!/usr/bin/python3
from os import system
from os import mkdir
from os.path import exists
from shutil import rmtree
from threading import Thread
from time import sleep

from requests import get
from sys import argv


def worker(command: str):
    system(command)

# parsing arguments
if len(argv) != 3:
    print("Must be 2 arguments. 1 URL to m3u8 file. 2 out file name")
    exit(1)

try:
    base_url = argv[1]
    file_name = argv[2]

    TEMP_FOLDER = "/tmp/m3u8_loader"

    if exists(TEMP_FOLDER):
        rmtree(TEMP_FOLDER)
    mkdir(TEMP_FOLDER)

    response: str = get(base_url).text
    lines = [line for line in response.split("\n") if "#" not in line and line]
    files_list = ""

    pool:list[Thread] = []
    for number in range(len(lines)):
        link = lines[number]

        if link:
            print(f"Loading {number + 1} from {len(lines)}")
            to_download = ""

            # preparing
            if "http" in link:
                to_download = link
                link = f"{number}.ts"
            else:
                to_download = base_url.replace("index.m3u8", link)

            # create thread to download
            process = Thread(target=worker, args=("wget -O %s/%d.ts -q '%s'" % (TEMP_FOLDER, number ,to_download),), daemon=True)
            process.start()
            pool.append(process)
            files_list += f"file '{TEMP_FOLDER}/{number}.ts'\n"

            while len(pool) > 50:
                to_delete = [t for t in pool if not t.is_alive()]

                for td in to_delete:
                    pool.remove(td)
                
                sleep(0.1)

    print("Finish loading ...")
    while len(pool) > 0:
        to_delete = [t for t in pool if not t.is_alive()]

        for td in to_delete:
            pool.remove(td)
        
        sleep(0.1)
            
    open("%s/files.list" %(TEMP_FOLDER),"w").write(files_list)
    print("Compressing to one file")
    system("ffmpeg -f concat -safe 0 -loglevel error -i %s/files.list -c copy %s.mp4" % (TEMP_FOLDER,file_name))

    print("Deleting cached data")
except Exception as e:
    print("Error. Download not successfull")
    print(e)

# deleting temp folder 
finally:
    # rmtree(TEMP_FOLDER)
    pass
