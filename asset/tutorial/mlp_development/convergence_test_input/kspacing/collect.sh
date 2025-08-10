for i in 0.50 0.45 0.40 0.35 0.30 0.25 0.20 0.15 0.10; do
	e=$(grep "sigma->0" $i/OUTCAR | tail -n 1 | awk '{print $7}')
	n=$(grep "LOOP" $i/OUTCAR | wc -l)
        n=$(($n-1))
        t=$(grep "LOOP" $i/OUTCAR | tail -n 1 | awk '{print $NF}')
        t_used=$(echo "scale=2; $t / $n" | bc)
        echo "$i,$e,$t_used"
done
