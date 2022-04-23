# BBLib

[![CI Status](https://img.shields.io/travis/bianruifeng/BBLib.svg?style=flat)](https://travis-ci.org/bianruifeng/BBLib)
[![Version](https://img.shields.io/cocoapods/v/BBLib.svg?style=flat)](https://cocoapods.org/pods/BBLib)
[![License](https://img.shields.io/cocoapods/l/BBLib.svg?style=flat)](https://cocoapods.org/pods/BBLib)
[![Platform](https://img.shields.io/cocoapods/p/BBLib.svg?style=flat)](https://cocoapods.org/pods/BBLib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BBLib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'BBLib'
```
未发布到 `CocoaPods` 需要指定资源地址
```ruby
pod 'BBLib', :git => 'https://github.com/bianrui/BBLib.git'
```
在需要监听返回的viewcontroller 中加入
```objective-c
//在以下方法中需要自己手动做pop操作
#pragma mark- BackButtonHandlerProtocol
-(BOOL)bb_backGestureAction{
    NSLog(@"右滑返回手势");
    return NO;
}

- (BOOL)bb_backBarButtonItemDidClickAction {
    NSLog(@"点击返回按钮");
    return NO;
}
```
如果监听方法没有执行，请将工程主要文件直接拖入项目。即可正常使用。
## Author

bianruifeng

## License

BBLib is available under the MIT license. See the LICENSE file for more info.
