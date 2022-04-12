## CS535  Final Project


### Setup
Assumes working Spark cluster from PA1

on a cs lab machine...

1. install pyspark
```
pip3 install pyspark --user
```

2. install jupyter notebook, add to path, and run
```
pip3 install notebook --user
export PATH=$PATH:$HOME/.local/bin
jupyter notebook --no-browser
```


3. connect from local machine
```
ssh -L 8888:localhost:8888 -N <cs-host-machine>
```


### Add data to Hadoop 
```
cd $CS535_FP_HOME
cd input
wget https://files.grouplens.org/datasets/tag-genome-2021/genome_2021.zip
unzip genome_2021.zip
mv movie_dataset_public_final/raw/* ./
rm -r __MACOSX/
rm -r movie_dataset_public_final/
input update
rm $CS535_FP_HOME/input/*
```
