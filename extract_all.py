import subprocess
import os
from tqdm import tqdm

progress_bar = tqdm(total=1000, desc='Procs')

# for hiding output from script
out = open(os.devnull, 'w')

def create_proc(i):
    proc = subprocess.Popen(['./extract_feat_anth.sh', str(i).zfill(3)], stdout=out, stderr=out)
    return proc

i = 0
while i <= 999:
    # p1 = create_proc(i)
    # progress_bar.update()
    # i += 1

    # p2 = create_proc(i)
    # progress_bar.update()
    # i += 1

    # p1.wait()
    # p2.wait()

    p1 = create_proc(i)
    p1.wait()

    progress_bar.update()
    i+= 1