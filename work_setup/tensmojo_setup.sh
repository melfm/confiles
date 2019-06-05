#!/bin/bash
set -e
# Pre-requisite : cuda_9.0, virtualenv
# Create virtual envrionment
virtualenv -p python3 tensmojo

# Activate virtualenv
source ./home/melissa/Workspace/tensmojo/bin/activate

# Install tensorflow
pip3 install tensorflow-gpu

# Install cuDNN
# go to website and download cudnn-7 https://developer.nvidia.com/cudnn
# tar -zxvf cudnn-7.0-linux-x64-v5.1.tgz

# copy libs to /usr/local/cuda folder
# sudo cp -P cuda/include/cudnn.h /usr/local/cuda/include
# sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda/lib64
# sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*

# Download and unzip
wget https://www.roboti.us/download/mjpro150_linux.zip -O ~/Downloads/mjpro150_linux.zip
unzip ~/Downloads/mjpro150_linux.zip -d ~/.mjpro150
rm ~/Downloads/mjpro150_linux.zip

# Set paths
# echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/ml/$USER/.mjpro150/mjpro150/bin">>~/.bashrc
# echo "export MUJOCO_PY_MJPRO_PATH=/home/ml/$USER/.mjpro150/mjpro150">>~/.bashrc
# echo "export MUJOCO_PY_MJKEY_PATH=/usr/local/pkgs/MuJoCo/mjpro150/bin/mjkey.txt">>~/.bashrc

# Box2D dependency
sudo apt-get install swig
# Install appropriate gym/mujoco-py
pip3 install 'mujoco_py==1.50.1.56'
pip3 install 'seaborn'
pip3 install 'Box2D==2.3.2'

########################################################################
# Trouble-shooting - Import mujoco_py
# osmesashim.c:1:10: fatal error: GL/osmesa.h: No such file or directory
# #include <GL/osmesa.h>
# Sol-> sudo apt-get install libosmesa6-dev

# FileNotFoundError: [Errno 2] No such file or directory: 'patchelf': 'patchelf'
# sudo curl -o /usr/local/bin/patchelf https://s3-us-west-2.amazonaws.com/openai-sci-artifacts/manual-builds/patchelf_0.9_amd64.elf
# sudo chmod +x /usr/local/bin/patchelf

# import gym
# env = gym.make('Humanoid-v2')
# env.reset()
# env.render()
#
# Creating window glfw
# ERROR: GLEW initalization error: Missing GL version
# Sol -> sudo apt-get install libglew-dev

# GLFW error (code %d): %s 65542 b'EGL: Failed to get EGL display: Success'
# Sol -> Make sure nvidia-gpu is enabled
# export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so

########################################################################
# Trouble-shooting - Import scipy
# RuntimeWarning: numpy.dtype size changed, may indicate binary incompatibility. Expected 96, got 88
# Sol -> 
# pip uninstall -y scipy scikit-learn
# pip install --no-binary scipy scikit-learn





