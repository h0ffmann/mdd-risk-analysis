#!/bin/bash
cd src/mdd/ 
spark-submit --class "mddApp" --master local[4] target/scala-2.11/simple-project_2.11-1.0.jar
