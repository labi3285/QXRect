# QXRect
A super easy use frame tool for iOS views.

###  Basic Rect
```swift
var rect = QXRect()
rect.top = view.qxRect.top
rect.centerX = view.qxRect.centerX
rect.size = .init(20, 20)
myView.qxRect = rect
```
### Relation Rect
```swift
myView1.qxRect = view.qxRect.insideRect(.left(10), .center, .size(50, 50))
myView2.qxRect = myView1.qxRect.rightRect(.offset(10))
myView3.qxRect = myView2.qxRect.bottomRect(.offset(10), .left(5), .right(5))
```

Enjoy!

![](https://github.com/labi3285/QXRect/blob/master/screen.png)  
