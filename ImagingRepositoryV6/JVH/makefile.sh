while IFS=, read i r; do d[i]=${r//}; done < DestrieuxIndices.csv
declare -a c
while IFS=, read -a h; do for i in {1..194}; do [ ${#d[h[i]]} -eq 0 ] && continue; c[i]=${d[h[i]]}; done; done <<<$(head -n1 $1)

#printf "Subj_ScanDate,"


tail -n+2 $1 | while IFS=, read roi l; do [ ${#d[roi]} -eq 0 ] && continue; for r in ${!c[@]}; do echo -n "${d[roi]}-to-${c[r]},"; done; done

