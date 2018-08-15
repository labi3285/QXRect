//
//  UIs.swift
//  QXLayout
//
//  Created by labi3285 on 2018/7/2.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

class Label: UIButton {
    var isSelect: Bool = false {
        didSet {
            backgroundColor = isSelect ? UIColor.green : UIColor.white
        }
    }
    var title: String = "" {
        didSet {
            label.text = title
        }
    }
    lazy var label: UILabel = {
        let one = UILabel()
        one.font = UIFont.systemFont(ofSize: 15)
        one.textColor = UIColor.blue
        one.textAlignment = .center
        one.adjustsFontSizeToFitWidth = true
        return one
    }()
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        addSubview(label)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.qxRect = bounds.qxRect.insideRect(.left(10), .top(5), .bottom(5), .right(10))
    }
}

class LabelSlider: UIControl {
    
    var value: CGFloat = 20
    
    var title: String = "" {
        didSet {
            label.title = title
        }
    }
    
    lazy var label: Label = {
        let one = Label()
        return one
    }()
    
    lazy var slider: UISlider = {
        let one = UISlider()
        one.minimumValue = -100
        one.maximumValue = 100
        one.value = 20
        return one
    }()
    lazy var valueLabel: UILabel = {
        let one = UILabel()
        one.font = UIFont.systemFont(ofSize: 15)
        one.textColor = UIColor.red
        one.adjustsFontSizeToFitWidth = true
        one.text = "20.0"
        return one
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        addSubview(label)
        addSubview(slider)
        addSubview(valueLabel)
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.qxRect = bounds.qxRect.insideRect(.left(0), .top(0), .bottom(0), .width(100))
        slider.qxRect = bounds.qxRect.insideRect(.left(110), .right(50))
        valueLabel.qxRect = bounds.qxRect.insideRect(.right(10), .width(40))
    }
    @objc func valueChanged() {
        value = CGFloat(slider.value)
        valueLabel.text = String(format: "%.01f", value)
        sendActions(for: .valueChanged)
    }
}
