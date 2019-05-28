
ssh username@beluga.computecanada.ca

module load python/3.6
virtualenv -p python3.6 spin
source activate spin/bin/activate

cd spinningup
pip install -e .

pip3 install -U 'mujoco-py<2.1,>=2.0'

wget https://www.roboti.us/download/mjpro150_linux.zip -O mjpro150_linux.zip
unzip mjpro150_linux.zip -d ~/.mujoco/.mjpro150
rm mjpro150_linux.zip


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/melfm24/.mujoco/mjpro150/bin


