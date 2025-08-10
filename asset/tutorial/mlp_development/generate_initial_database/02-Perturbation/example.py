import dpdata 

sys = dpdata.System("POSCAR")
perturbed = sys.perturb(
    pert_num=10,
    cell_pert_fraction=0.05,
    atom_pert_distance=0.05,
    atom_pert_prob=1,
    atom_pert_style='normal'
)

import os 
os.makedirs("perturbed", exist_ok=True)
for idx in range(len(perturbed)):
    perturbed[idx].to("POSCAR", os.path.join("perturbed", f"POSCAR_{idx:02d}"))