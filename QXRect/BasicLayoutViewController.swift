//
//  BasicLayoutViewController.swift
//  QXLayout
//
//  Created by labi3285 on 2018/6/8.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

class BasicLayoutViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let one = UIView()
        one.backgroundColor = UIColor.yellow
        return one
    }()
    lazy var labels: [UILabel] = {
        return (0...20).map { (i) -> UILabel in
            let label = UILabel()
            label.backgroundColor = UIColor.green
            label.textAlignment = .center
            label.textColor = UIColor.white
            label.adjustsFontSizeToFitWidth = true
            label.text = "\(i)"
            view.addSubview(label)
            return label
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        for label in labels {
            view.addSubview(label)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var rect = view.qxRect
        rect.width = 200
        rect.height = 200
        containerView.qxRect = rect
        
        do {
            var _rect = QXRect()
            _rect.leftTop = rect.leftTop
            _rect.size = .init(20, 20)
            labels[0].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.topCenter = rect.topCenter
            _rect.size = .init(20, 20)
            labels[1].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.rightTop = rect.rightTop
            _rect.size = .init(20, 20)
            labels[2].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.leftCenter = rect.leftCenter
            _rect.size = .init(20, 20)
            labels[3].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.center = rect.center
            _rect.size = .init(20, 20)
            labels[4].qxRect = _rect
        }

        do {
            var _rect = QXRect()
            _rect.rightCenter = rect.rightCenter
            _rect.size = .init(20, 20)
            labels[5].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.leftBottom = rect.leftBottom
            _rect.size = .init(20, 20)
            labels[6].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.bottomCenter = rect.bottomCenter
            _rect.size = .init(20, 20)
            labels[7].qxRect = _rect
        }
        
        do {
            var _rect = QXRect()
            _rect.bottomRight = rect.bottomRight
            _rect.size = .init(20, 20)
            labels[8].qxRect = _rect
        }
        
        
    }
    
    
}
