# Hadoop cluster deploy

Scripts for deploying Hadoop to the cloud. Currently there is only two cloud provides supported: GCP and Azure.

# Versions

The versions installed for each software can be changed inside the scripts, however the configuration might change through different versions, so it might not work. The versions used are:

* Hadoop 3.2.1
* Spark 3.0.1
* HBase 2.2.5 specially compiled to use Hadoop 3.2.1, the current distributed version of HBase 2.2.5 is compiled against Hadoop 2.8.5.

# Problems

* The start-yarn.sh and start-hbase.sh executed from inside ansible roles are not working as expected, so after installation you should enter the master server and run those scripts manually.

* Right now there is no hbase-spark library compiled against Scala 2.12, at least to my knowledge. So there is no easy way to connect an application for Spark 3.0.1 with HBase 2.2.5.
