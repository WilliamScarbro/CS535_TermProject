
echo "FinalProject tools"

#echo "  run <local|cluster> <small|full>"
#function run {
#	if [[ -z "${CS535_PA1_HOME}" ]]; then
#		echo "Set env variable \"CS535_PA1_HOME\" to git project home"
#		return
#	fi
#	loc=$1
#	input=$2
#	target=$CS535_PA1_HOME/target/scala-2.12/pa1scala_2.12-0.1.jar
#	if [[ $input == "small" ]]; then
#		inputs="/PA1/cit_small.txt /PA1/pub_small.txt"
#	elif [[ $input == "full" ]]; then
#		inputs="/PA1/citations.txt /PA1/published-dates.txt"
#	else 
#		echo "unknown input $input"
#		return 1
#	fi
#	filter=
#	# comment the following line to see full spark output
#	#filter="2>/dev/null"
#	if [[ $loc == "local" ]]; then
#		bash -c "$SPARK_HOME/bin/spark-submit --class PA1 \
#		--master local \
#		$target $inputs $filter"
#	elif [[ $loc == "cluster" ]]; then
#	    bash -c "$SPARK_HOME/bin/spark-submit --executor-memory 4G --class PA1 \
#	    --deploy-mode cluster \
#	    --supervise  $target $inputs $filter"
#	else
#		echo "invalid option: $loc"
#		return
#	fi
#}

echo "  input <update|show>"
function input {
	if [[ -z "${CS535_FP_HOME}" ]]; then
		echo "Set env variable \"CS535_FP_HOME\" to git project home"
		return
	fi
	arg=$1
	if [[ $arg == "update" ]]; then
		hadoop fs -mkdir /FP
		for f in $CS535_FP_HOME/input/*; do
			name=${f##*/}
			echo "updating $name"
			hadoop fs -rm /FP/$name
			hadoop fs -put $f /FP/$name
		done
	elif [[ $arg == "show" ]]; then
		set -x
		hadoop fs -ls /FP
		set +x
	else
		echo "invalid option: $arg"
	fi
}
echo "  output <clear|show>"
function output {
	arg=$1
	if [[ $arg == "clear" ]]; then
		hadoop fs -rm -r /FP/output
	elif [[ $arg == "show" ]]; then
		hadoop fs -cat /FP/output/*
	else
		echo invalid option: $arg
	fi
}


