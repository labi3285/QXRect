//
//  PossitionLayoutViewController.swift
//  QXLayout
//
//  Created by labi3285 on 2018/6/8.
//  Copyright © 2018年 labi3285. All rights reserved.
//

import UIKit

class RelationLayoutViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let one = UIScrollView()
        one.bounces = false
        one.showsHorizontalScrollIndicator = false
        one.showsVerticalScrollIndicator = false
        return one
    }()
    lazy var container: UIView = {
        let one = UIView()
        one.backgroundColor = UIColor.yellow
        return one
    }()
    lazy var labels: [Label] = {
        var one = [Label]()
        for title in ["inside", "top", "left", "bottom", "right"] {
            let label = Label()
            label.title = title
            label.addTarget(self, action: #selector(handleSelectLabel(_:)), for: .touchUpInside)
            one.append(label)
        }
        return one
    }()
    lazy var sliders: [LabelSlider] = {
        var one = [LabelSlider]()
        for title in ["top", "left", "bottom", "right", "width", "height", "offset"] {
            let label = LabelSlider()
            label.title = title
            label.label.addTarget(self, action: #selector(handleSelectSlider(_:)), for: .touchUpInside)
            label.addTarget(self, action: #selector(handleSliderChange(_:)), for: .valueChanged)
            one.append(label)
        }
        return one
    }()
    lazy var centers: [Label] = {
        var one = [Label]()
        for title in ["centerX", "centerY", "center"] {
            let label = Label()
            label.title = title
            label.addTarget(self, action: #selector(handleSelectCenter(_:)), for: .touchUpInside)
            one.append(label)
        }
        return one
    }()

    lazy var theView: UIView = {
        let one = UIView()
        one.backgroundColor = UIColor.red
        return one
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(UIScrollView())
        view.addSubview(scrollView)
        scrollView.addSubview(container)
        scrollView.addSubview(theView)
        for label in labels {
            scrollView.addSubview(label)
        }
        for slider in sliders {
            scrollView.addSubview(slider)
        }
        for label in centers {
            scrollView.addSubview(label)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        var rect = QXRect()
        rect.size = .init(100, 100)
        rect.centerX = scrollView.qxRect.centerX
        rect.top = 64 + 100
        container.qxRect = rect
        do {
            weak var last: Label?
            for label in labels {
                let w = (view.qxSize.width - 20 * 2 - 5 * 4) / 5
                if let last = last {
                    label.qxRect = last.qxRect.rightRect(.offset(5))
                } else {
                    var rect = QXRect()
                    rect.top = container.qxRect.bottom + 100
                    rect.left = scrollView.qxRect.left + 20
                    rect.size = .init(w, 40)
                    label.qxRect = rect
                }
                last = label
            }
        }
        do {
            weak var last: LabelSlider?
            for slider in sliders {
                if let last = last {
                    slider.qxRect = last.qxRect.bottomRect()
                } else {
                    var rect = QXRect()
                    rect.top = labels.last!.qxRect.bottom + 5
                    rect.left = scrollView.qxRect.left + 20
                    rect.right = scrollView.qxRect.right - 20
                    rect.height = 30
                    slider.qxRect = rect
                }
                last = slider
            }
        }
        do {
            weak var last: Label?
            for label in centers {
                let w = (view.qxSize.width - 20 * 2 - 5 * 2) / 3
                if let last = last {
                    label.qxRect = last.qxRect.rightRect(.offset(5))
                } else {
                    var rect = QXRect()
                    rect.top = sliders.last!.qxRect.bottom
                    rect.left = scrollView.qxRect.left + 20
                    rect.size = .init(w, 30)
                    label.qxRect = rect
                }
                last = label
            }
        }
        scrollView.contentSize = CGSize(width: scrollView.bounds.width, height: centers.last!.frame.maxY)
    }
    
    private var _label: String = ""
    @objc func handleSelectLabel(_ label: Label) {
        for label in labels {
            label.isSelect = false
        }
        label.isSelect = true
        _label = label.title
        handleLayout()
    }
    
    @objc func handleSelectSlider(_ label: Label) {
        label.isSelect = !label.isSelect
        handleLayout()
    }
    @objc func handleSliderChange(_ slider: LabelSlider) {
        handleLayout()
    }
    @objc func handleSelectCenter(_ label: Label) {
        label.isSelect = !label.isSelect
        handleLayout()
    }
    
    func handleLayout() {
        var relations: [QXRect.Relation] = []
        for slider in sliders {
            switch slider.title {
            case "top":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.top(slider.value))
                }
            case "left":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.left(slider.value))
                }
            case "bottom":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.bottom(slider.value))
                }
            case "right":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.right(slider.value))
                }
            case "width":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.width(slider.value))
                }
            case "height":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.height(slider.value))
                }
            case "offset":
                if slider.label.isSelect {
                    relations.append(QXRect.Relation.offset(slider.value))
                }
            default:
                break
            }
        }
        for center in centers {
            switch center.title {
            case "centerX":
                if center.isSelect {
                    relations.append(QXRect.Relation.centerX)
                }
            case "centerY":
                if center.isSelect {
                    relations.append(QXRect.Relation.centerY)
                }
            case "center":
                if center.isSelect {
                    relations.append(QXRect.Relation.center)
                }
            default:
                break
            }
        }
        switch _label {
        case "inside":
            theView.qxRect = container.qxRect.insideRect(relations)
        case "top":
            theView.qxRect = container.qxRect.topRect(relations)
        case "left":
            theView.qxRect = container.qxRect.leftRect(relations)
        case "bottom":
            theView.qxRect = container.qxRect.bottomRect(relations)
        case "right":
            theView.qxRect = container.qxRect.rightRect(relations)
        default:
            break
        }
    }
    
}
