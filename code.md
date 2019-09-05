# Installation
Download and install the .deb package (64-bit) from the website

```
sudo dpkg -i <file>.deb
sudo apt-get install -f 
```

## SSH Setup
On the host computer, if you don't have a ssh key already, generate :
```
ssh-keygen -t rsa -b 4096
```
Copy it over to the remote pc:
```
ssh-copy-id your-user-name-on-host@host-fqdn-or-ip-goes-here
ssh-copy-id mfmozifi@lulu.cim.mcgill.ca
```

From code,run Remote-SSH: Connect to Host... from the Command Palette `F1` 
and enter the host and your user on the host in the input box as follows: user@hostname.

To avoid re-entering passphrase, do
```
ssh-add
```
