LPSwitchButton
==============

### What is LPSwitchButton ?
LPSwitchButton is a switch control for cocoa just like UISwitch in iOS.
![LPSwitchButton](http://ww2.sinaimg.cn/large/6cb9ee11jw1e5lowgq662j20gi0ds0t5.jpg)
### How to use LPSwitchButton ?
LPSwitchButton has two type. 
- KLPSwitchButtonTypeRound 
- kLPSwitchButtonTypeSquare

you can set color or add image to it.

init with frame
```
LPSwitchButton *switch = [[LPSwitchButton alloc] initWithFrame: NSMakeRect(150, 250, 70, 30)];
```
set type, default is kLPSwitchButtonTypeRound
```
[switch setType: kLPSwitchButtonTypeSquare];
```
set color
```
[switch setTintColor: [NSColor colorWithCalibratedRed: 127 * 1.0 / 255  green: 140 * 1.0 / 255 blue: 141 * 1.0 / 255 alpha: 1]];
[switch setThumbTintColor: [NSColor colorWithCalibratedRed: 231 * 1.0 / 255 green: 76 * 1.0 / 255 blue: 60 * 1.0 / 255 alpha: 1]];
[switch setOnTintColor: [NSColor colorWithCalibratedRed: 52 * 1.0 /255 green: 152 * 1.0 / 255 blue: 219 * 1.0 / 255 alpha: 1]];
```
add target and action
```
[btn addTarget: self action: @selector(btnClick:)];
```
also you can set image for LPSwitchButton, just like this.
```
[switch setOffImage: [NSImage imageNamed: @"1.png"]];
[switch setOnImage: [NSImage imageNamed: @"2.png"]];
[switch setPointImage: [NSImage imageNamed: @"3.png"]];
````
thx.
coocamad.



