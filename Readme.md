# Vagrant Init Files

## Installation

### Required Softwares

The following softwares are required. Please install the below listed sofwares and restart your system.

 * VirtualBox
 * Vagrant
 * GitBash

### Folder Structure

You can use any folder structure on Windows machine. For the sake of uniformity I would recommend having a folder C:\Projects and clone this repository into C:\Projects as vagrant folder.

### Configuration

Inside the vagrant folder you will find *Config.yaml.example* file. Please copy this file to the same folder and rename it to *Config.xml*. If you are using *GitBash* you can do this by executing:

```bash
cd c:\Projects\Vagrant
cp Config.yaml.example Config.yaml
```

You can customize this file based on your needs.

### Envirnoment Setup

Clone the required Envirnoment repository inside C:\Projects folder as envirnoment folder.


## Running Vagrant

To run vagrant open *GitBash* or *Windows Powershell* and execute the following:

```bash
cd c:\Projects\vagrant
vagrant up
```

## SSH into Vagrant box

To SSH into the Vagrant Box, open *GitBash* or *Windows Powershell* and execute the following:

```bash
cd c:\Projects\Vagrant
vagrant ssh
```

## Shutting Down the box

To Power off the box open *GitBash* or *Windows Powershell* and execute the following:

```bash
cd c:\Projects\Vagrant
vagrant halt
```
