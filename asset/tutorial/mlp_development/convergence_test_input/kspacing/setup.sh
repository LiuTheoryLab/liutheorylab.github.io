for i in 0.50 0.45 0.40 0.35 0.30 0.25 0.20 0.15 0.10; do 
	echo "KSPACING = $i"
	mkdir $i;
	cp input/* $i/;
	sed -i "s/KSPACING = 0.30/KSPACING = $i/" $i/INCAR;

done
