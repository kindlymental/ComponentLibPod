//
//  MarqueeViewController.swift
//  AnimationDemo
//
//  Created by 刘怡兰 on 2019/1/6.
//  Copyright © 2019 lyl. All rights reserved.
//

import UIKit
import SnapKit

/// 广播跑马灯效果
class MarqueeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadUI()
        
        let queue = DispatchQueue.global()
        queue.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.loadData()
        }
    }
    
    func loadUI() {

        marqueeView.model = marqueeModel
        
        marqueeView.selectionAction { (model) in
            self.view.makeToast("点击跑马灯")
            print(model.title!)
        }
    }
    
    func loadData() {
        
        DispatchQueue.main.async {
            self.marqueeModel.title = "该方法接收一个DispatchTime的参数,点进这个类型的里面可以发现实个结构体.那就是延时两秒了,是不是感觉还是有些麻烦,那么继续往下看~"
            self.marqueeModel.imageViewUrlStr = "http://mvimg2.meitudata.com/55fe3d94efbc12843.jpg"
            self.marqueeView.model = self.marqueeModel
        }
    }
    
    private lazy var marqueeView: MarqueeView = {
        let marqueeView = MarqueeView()
        view.addSubview(marqueeView)
        marqueeView.backgroundColor = UIColor.clear
        marqueeView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(view)
            }
            make.height.equalTo(44)
        }
        return marqueeView
    }()
    
    private lazy var marqueeModel: MarqueeModel = {
        let marqueeModel = MarqueeModel()
        marqueeModel.title = ""
        marqueeModel.imageViewUrlStr = ""
        marqueeModel.font = UIFont.systemFont(ofSize: 14)
        return marqueeModel
    }()

}
