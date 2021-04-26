#!/usr/bin/bash


deep_path() {
	spath=$1	dpath=$2
	cd $1
	echo ""
	echo "[*]into $(pwd)"
	for fname in $(/usr/bin/ls ./); do
		#echo $fname
		if [ -d $fname ]; then
			echo "[+]$(pwd)/$fname/ is directory"
			#in_constrast
			deep_path "$fname"
		elif [ -f "$fname" ]; then
			echo "[+]$(pwd)/$fname is file"
		fi
	done
	cd ..
	echo "[*]back to $(pwd)"
}

in_contrast_to_dpath() {
	spath=$1	dpath=$2 
	absdpf=$2
	if [ !-e $dpath ]; then
		cp -r $spath $dpath 
	fi
}
 


deep_path "./" "/usr/share/metasploitframework/" 
	

