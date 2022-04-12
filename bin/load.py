import os
import pyspark
from pyspark.sql import SQLContext, SparkSession

sc = SparkSession.builder.master('spark://pierre.cs.colostate.edu:31820').appName('test').getOrCreate()

sqlContext = SQLContext(sparkContext=sc.sparkContext, sparkSession=sc)
print("Spark Version: " + sc.version)
print("PySpark Version: " + pyspark.__version__)


df=sc.read.json("hdfs://pierre.cs.colostate.edu:31801/FP/example.json")
df.show()
