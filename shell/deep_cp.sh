#!/bin/bash

ORIGINAL_SPATH="$(pwd)"
ORIGINAL_DPATH="/usr/share/metasploit-framework/"


function CreateAbsDpath() {
	echo "$1$2"
}

function IsExistedDfilename() {
	ABS_DPATH=$1
	if [ -e $ABS_DPATH ]; then
		return 0
	else
		return 1
	fi
}

function CpDtoDpath() {
	spath=$1
	dpath=$2
	if IsExistedDfilename "$dpath"; then
		echo "this directory is exited $dpath, no copy override!"
	else 
		echo "cp $spath to $dpath"
		cp -r $spath $dpath
	fi
	return 0
}

function CpFtoDpath() {
	spath=$1
	dpath=$2
	if IsExistedDfilename "$dpath"; then
		echo "this file is exited $dpath, no copy override!"
	else 
		echo "cp $spath to $dpath"
		cp $spath $dpath
	fi
	return 0
}

function Deep_Copy() {
	FULLPATH=$1	
	ORIGINAL_SPATH=$2
	ORIGINAL_DPATH=$3

	echo ""
	echo "[*]cd $FULLPATH"
	for fName in $(/bin/ls $FULLPATH); do
		IsExistedBeforeCd "$FULLPATH/$fName"
		fileType=`/usr/bin/file "$FULLPATH/$fName" | /bin/awk '{FS=":"} {printf $2}'`
		tstr=$(CreateRelativePathname "$FULLPATH/$fName" "$ORIGINAL_SPATH")
		dpath=$(CreateAbsDpath "$ORIGINAL_DPATH" "$tstr")

		if [ "directory" == $fileType ]; then
			#printf "%s is %s!\n" $FULLPATH/$fName $fileType
			CpDtoDpath "$FULLPATH/$fName" "$dpath"
			Deep_Copy "$FULLPATH/$fName" "$ORIGINAL_SPATH" "$ORIGINAL_DPATH"
		else
			#printf "%s is file, is %s #########\n" $FULLPATH/$fName $fileType
			CpFtoDpath "$FULLPATH/$fName" "$dpath"
		fi
	done
	echo "cd .."

	return 0
}

function IsExistedBeforeCd() {
	FULLPATH=$1
	if [ ! -e "$FULLPATH/$fName" ]; then
		#echo "$FULLPATH"
		FULLPATH=${FULLPATH%\/*}
		IsExistedBeforeCd "$FULLPATH"
	fi
	return 0
}	

# Apath in contrast to Bpath
function CreateRelativePathname() { 			
	NOW_SPATH=$1	ORIGINAL_SPATH=$2	
	temp=${NOW_SPATH#$ORIGINAL_SPATH\/}
	echo "$temp"
	#return 0
}


Deep_Copy "$ORIGINAL_SPATH" "$ORIGINAL_SPATH" "$ORIGINAL_DPATH"

















function SetLineResultToNewFile() {
	str=$1
	filename=$2
	if [[ -e $filename ]]; then
		rm -f $filename
	fi
	echo "$str" > $filename
}

function SetLinesResultToNewFile() {
	str=$1
	filename=$2
	if [[ -e $filename ]]; then
		rm -f $filenme
	fi
	echo "$str" >> $filename
}

function SetLinesResultToOldile() {
	str=$1
	filename=$2
	echo "$str" >> $filename
}

function SetResultToFile() {
	cmdline=$1
	option=$2
	filename="t_shell_result.txt"
	if [[ "" = $3 ]]; then
		filename=$3
	fi
		
	if [[ "" != $option ]]; then  
		if [[ "1" == $option ]]; then 
			SetLineResultToNewFile 
		elif [[ "2" == $option ]]; then
			SetLinesResultToNewFile
		elif [[ "3" == $option ]]; then
			SetLinesResultToOldFile
		else
			echo "Happened error"
		fi
	fi
	return 0
}

function GetResultFromFile() {
	pass=$1
}
