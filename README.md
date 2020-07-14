# NMMultiUnitRuler
iOS library to select different size units using a Scrollable Ruler

It is simple customizable ruler control that support multiple units. The control supports these features:

- Customizable interface
- Compatible with iOS 11.0 NSUnit Framework
- Supports multiple units
- Customize marker colors based on type or their value
- Customize the width, length and number of markers of the ruler
- Customize the unit formatter

<img src="https://raw.githubusercontent.com/namshi/NMMultiUnitRuler/master/Screenshots/NMMultiUnitRuler.png" width="300"> 
<img src="https://raw.githubusercontent.com/namshi/NMMultiUnitRuler/master/Screenshots/NMMultiUnitRuleriPhoneX.png" width="300"> 

<br>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

NMMultiUnitRuler is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "NMMultiUnitRuler"
```
and run pod install in terminal.
Usage

### Compatibility

iOS 11+

xCode 9.0+

Swift 5.0

####You can use storyboard to create a control element.


## How to use


```swift
class ViewController: UIViewController, NMMultiUnitRulerDataSource, NMMultiUnitRulerDelegate {

}
```

 Set the ruler direction to horizontal

```swift
ruler.direction = .horizontal
```

```swift
ruler.direction = .vertical
```
![Vertical Ruler](https://s3.amazonaws.com/farshid.ghods.github/ruler-vertical-1.jpg)

Specify how many units the ruler will display

```swift
    var numberOfSegments: Int {
        get {
            return 2.0
        }
    }
```

Originally inspired by [RKMultiUnitRuler](https://github.com/farshidce/RKMultiUnitRuler) 
