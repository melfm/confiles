
Pybullet compile error:
```
/home/melissa/Workspace/nas/bullet3/examples/pybullet/pybullet.c:32:20: fatal error: Python.h: No such file or directory
```

Solution: Missing python-dev, make sure to install for the correct version of python
```
sudo apt-get install python3.6-dev
```
