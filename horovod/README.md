### Horovod Setup


instructions for setting up horovod 


1. Edit hosts file
Replace with hosts from your cluster

2. install horovod
add following to ~/.bashrc (and source)
	export PYTHONPATH=/s/chopin/k/grad/<eid>/.local/lib/python3.8/site-packages
run install.sh script
notice we use /bin/python3.8 -m pip to install

3. run horovod
add the following to bashrc (and source)
	export LD_LIBRARY_PATH="/usr/local/cuda/latest/lib64"
run exmaple project with run.sh
notice we point to python3.8 when running horovod


make sure that the variables in defined in bashrc are not being overwritten somewhere else
