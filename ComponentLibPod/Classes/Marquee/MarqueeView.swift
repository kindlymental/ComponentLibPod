//
//  MarqueeView.swift
//  AnimationDemo
//
//  Created by 刘怡兰 on 2019/1/6.
//  Copyright © 2019 lyl. All rights reserved.
//

import UIKit
import Kingfisher
import Toast_Swift

class MarqueeView: UIView {
    
    // 广播按钮
    private lazy var marqueeView: UIButton = {
        let marqueeView = UIButton.init()
        marqueeView.setImage(UIImage(named: "marquee"), for: .normal)
        marqueeView.imageView?.contentMode = .scaleAspectFit
        marqueeView.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        return marqueeView
    }()
    
    // 滚动区域
    private lazy var activityView: UIView = {
        let activityView = UIView(frame: .zero)
        return activityView
    }()
    
    /// 初始化定时器
    private lazy var timer: Timer = {
        let timer = Timer(timeInterval: 0.01, target: self, selector: #selector(startToMove), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .commonModes)
        return timer
    }()
    
    
    /// 赋值操作
    public var model = (MarqueeModel)() {
        didSet {
            
            // 关闭定时器
            if timer.isValid {
                timer.fireDate = Date.distantFuture
            }
            
            let item = MarqueeItem()
            item.model = model
            activityView.addSubview(item)
            
            item.snp.makeConstraints { (make) in
                make.left.equalTo(5)
                make.bottom.top.right.equalToSuperview()
            }
            
            item.marqueeViewDidTap = {
                self.selectionBlock?(self.model)
            }
            
            layoutIfNeeded()
            
            // 启动定时器
            timer.fireDate = Date(timeIntervalSinceNow: 0)
        }
    }
    
    private var selectionBlock: ((MarqueeModel) -> Void)?
    
    // 监听点击事件
    public func selectionAction(_ callBack: ((MarqueeModel) -> Void)?) {
        selectionBlock = callBack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        if timer.isValid {
            timer.invalidate()
        }
    }
    
    private func loadUI() {
        
        addSubview(activityView)
        addSubview(marqueeView)
        
        marqueeView.backgroundColor = UIColor.white
        
        marqueeView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(40)
        }
        
        activityView.snp.makeConstraints { (make) in
            make.left.equalTo(marqueeView.snp.right)
            make.top.bottom.equalToSuperview()
        }
    }
    
    /// 移动动画
    @objc private func startToMove() {
        
        activityView.x = activityView.x - 0.5
        if activityView.x <= -activityView.width {
            activityView.x = self.bounds.size.width
        }
    }
   
}


class MarqueeItem: UIView {
    
    // 文本
    private var textLabel: UILabel!
    
    // 图片
    private var imgView: UIImageView!
    
    // 模型赋值
    fileprivate var model: MarqueeModel? {
        didSet {
            if model != nil {
                textLabel.text = model?.title
                textLabel.textColor = model?.textColor
                textLabel.font = model?.font
                if let url = URL(string: model?.imageViewUrlStr ?? "") {
                    imgView.kf.setImage(with: ImageResource(downloadURL: url, cacheKey: "MarqueeItemImage_cache_key"))
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadUI() {
        
        // 点击手势
        let gesture = UITapGestureRecognizer(target: self, action: #selector(itemClick))
        addGestureRecognizer(gesture)
        
        textLabel = UILabel()
        textLabel.sizeToFit()
        addSubview(textLabel)
        
        imgView = UIImageView()
        addSubview(imgView)
        
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.centerY.equalToSuperview()
        }
        
        imgView.snp.makeConstraints { (make) in
            make.left.equalTo(textLabel.snp.right).offset(5)
            make.right.bottom.equalTo(-5)
            make.top.equalTo(5)
            make.width.equalTo(imgView.snp.height)
        }
    }
    
    @objc private func itemClick() {
        // 将事件传递出去
        marqueeViewDidTap?()
    }
    
    fileprivate var marqueeViewDidTap:(() -> Void)?
}
