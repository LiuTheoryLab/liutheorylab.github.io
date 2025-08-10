for i in 0.50 0.45 0.40 0.35 0.30 0.25 0.20 0.15 0.10; do 
	echo "KSPACING = $i"
	cd $i
	sbatch vasp.slurm
	cd ..
done
