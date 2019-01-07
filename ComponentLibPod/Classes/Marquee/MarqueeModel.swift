//
//  MarqueeModel.swift
//  AnimationDemo
//
//  Created by 刘怡兰 on 2019/1/6.
//  Copyright © 2019 lyl. All rights reserved.
//

import UIKit

class MarqueeModel: NSObject {

    // 文本内容
    var title: String?
    
    // 图片
    var imageViewUrlStr: String?
    
    // 字体默认颜色
    var textColor: UIColor = .black
    
    // 字体大小
    var font: UIFont = .systemFont(ofSize: 14)
    
    // 图片默认背景
    var imageViewHolder: UIImage = UIImage.init(named: "marquee")!
    
}
