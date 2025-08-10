for i in 400 450 500 550 600 650 700 750 800 850 900 950 1000; do
	e=$(grep "sigma->0" $i/OUTCAR | tail -n 1 | awk '{print $7}')
	n=$(grep "LOOP" $i/OUTCAR | wc -l)
        n=$(($n-1))
        t=$(grep "LOOP" $i/OUTCAR | tail -n 1 | awk '{print $NF}')
        t_used=$(echo "scale=2; $t / $n" | bc)
        echo "$i,$e,$t_used"
done
