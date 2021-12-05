### 💡 What is DeviceInfo About?
Device info is a short and quick batch script which collects short PC specification and PC saved device information (eg. Net adapters, bluetooth devices)

### 🚀 Download and Usage
You can download source.bat from repository and use as
> call directory\source.bat

Or you can use [Installation command]()

### 🎈 Parameters
deviceinfo [`--NoColors`] [`--Filter (option)`] 

The script offers also parameters
For example
> deviceinfo --NoColors
will generate output without colors usage

> deviceinfo --Filter USB
will display only saved usb devices

You can also combine parameters
> deviceinfo --NoColors --Filter PC

But you can't run multiple filters
> ~~deviceinfo --Filter PC USB~~
> ~~deviceinfo --Filter PC --Filter USB~~
> ~~deviceinfo --NoColors --Filter PC USB~~

### 🧵 Available parameters
Available parameters are
- PC
- USB
- Bluetooth
- Media
- Net

### 📸 Screenshots