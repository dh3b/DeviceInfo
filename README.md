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
> 
> ~~deviceinfo --Filter PC --Filter USB~~
> 
> ~~deviceinfo --NoColors --Filter PC USB~~
> 

### 🧵 Available parameters
Available parameters are
- PC
- USB
- Bluetooth
- Media
- Net

### 📸 Screenshots
![image](https://user-images.githubusercontent.com/74708369/144753509-81f153be-000e-401a-afa0-193d81d92813.png)
![image](https://user-images.githubusercontent.com/74708369/144753511-58f62e28-3d6b-4435-abff-db15785939d2.png)
![image](https://user-images.githubusercontent.com/74708369/144753515-ff15c982-bba7-4e9e-94fb-63f226457c6d.png)
