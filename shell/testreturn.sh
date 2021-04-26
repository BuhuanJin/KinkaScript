function setResult1() {
	s1=$1
	s2=$2
	result=$(echo $s1 | grep "${s2}")
	if [[ "" != "$result" ]]; then
		echo "include"
	else
		echo "not include"
	fi
}

str="sdjklfjd\:sklsjdklf"
ff=$(setResult1 "$str" "o")
echo $ff
echo $ff
echo $ff

function lf1() {
	t1=$1
	if [[ "" == $1 ]]; then
		echo "ok"
	else
		echo "not ok"
	fi

}

#lf1
