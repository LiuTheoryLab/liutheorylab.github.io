import dpdata 
from glob import glob
from pathlib import Path
from ase.io import read 

def find_data_new(dir: str, file: str, out_dir: str):
    dir = Path(dir)
    out_dir = Path(out_dir)
    dir_list = [str(i) for i in dir.rglob("*") if (i / file).is_file()]
    ms = dpdata.MultiSystems()
    for i in dir_list:
        ms.append(dpdata.LabeledSystem(i,fmt='abacus/md'))
    print(ms)
    for i in ms:
        print(i)
    ms.to_deepmd_npy(out_dir)


if __name__=="__main__":
    find_data_new("./", "time.json", "collected_data")
