//
//  FuncButton.swift
//  UIKitLearn
//
//  Created by 江佳谊 on 2023/12/18.
//

import Foundation
import UIKit

class FuncButton: UIButton {
    init() {
        //自动布局，则frame设置为(0,0,0,0)
        super.init(frame: CGRect.zero)
        //按键之间的空隙
        self.layer.borderWidth = 1
        //空隙颜色
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1).cgColor
        //字体颜色
        self.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        //字号
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        //点击后的颜色
        self.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
    }
    required init?(coder aDecoder: NSCoder) {//子类必须继承的可失败构造方法
        fatalError("init(coder:) has not been implemented")
    }
}
