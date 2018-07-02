//
//  UIKit_ext.swift
//  QXRect
//
//  Created by labi3285 on 2018/6/3.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

extension UIView {
    
    /// QXRect for frame
    var qxRect: QXRect {
        set {
            frame = newValue.rect
        }
        get {
            return frame.qxRect
        }
    }
    
    /// QXSize for frame.size
    var qxSize: QXRect.Size {
        set {
            frame = CGRect(x: frame.minX, y: frame.minY, width: CGFloat(newValue.width), height: CGFloat(newValue.height))
        }
        get {
            return bounds.size.qxSize
        }
    }
    
    /// QXPoint for frame.origin
    var qxOrigin: QXRect.Point {
        set {
            frame = CGRect(x: CGFloat(newValue.x), y: CGFloat(newValue.y), width: frame.width, height: frame.height)
        }
        get {
            return frame.origin.qxPoint
        }
    }
    
}

extension CGSize {
    
    /// QXSize
    var qxSize: QXRect.Size {
        set {
            width = CGFloat(newValue.width)
            height = CGFloat(newValue.height)
        }
        get {
            return QXRect.Size(Double(width), Double(height))
        }
    }
    
}

extension QXRect.Size {
    
    /// CGSize
    var size: CGSize {
        set {
            width = Double(newValue.width)
            height = Double(newValue.height)
        }
        get {
            return CGSize(width: CGFloat(width), height: CGFloat(height))
        }
    }
    
}

extension CGPoint {
    
    /// QXPoint
    var qxPoint: QXRect.Point {
        set {
            x = CGFloat(newValue.x)
            y = CGFloat(newValue.y)
        }
        get {
            return QXRect.Point(Double(x), Double(y))
        }
    }
    
}

extension QXRect.Point {
    
    /// CGPoint
    var point: CGPoint {
        set {
            x = Double(newValue.x)
            y = Double(newValue.y)
        }
        get {
            return CGPoint(x: CGFloat(x), y: CGFloat(y))
        }
    }
}

extension CGRect {
    
    /// QXRect
    var qxRect: QXRect {
        set {
            origin = newValue.origin.point
            size = newValue.size.size
        }
        get {
            var rect = QXRect()
            rect.center = CGPoint(x: minX + width * 0.5, y: minY + height * 0.5).qxPoint
            rect.size = size.qxSize
            return rect
        }
    }
    
}

extension QXRect {
    
    /// CGRect
    var rect: CGRect {
        set {
            center = CGPoint(x: newValue.minX + newValue.width * 0.5, y: newValue.minY + newValue.height * 0.5).qxPoint
            size = newValue.size.qxSize
        }
        get {
            return CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
}