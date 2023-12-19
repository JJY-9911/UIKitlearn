//
//  Board.swift
//  UIKitLearn
//
//  Created by 江佳谊 on 2023/12/18.
//

import Foundation
import SnapKit
import UIKit

protocol BoardButtonInputDelegate {
    func boardButtonClick(content: String)
}

class Board: UIView {
    var dataArray = [
        "0",
        ".",
        "%",
        "=",
        "1",
        "2",
        "3",
        "+",
        "4",
        "5",
        "6",
        "-",
        "7",
        "8",
        "9",
        "x",
        "AC",
        "Delete",
        "^",
        "/"
    ]
    
    var delegate: BoardButtonInputDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installUI()
    }
    
 
    func installUI() {
        var frontBtn: FuncButton!
        
        for index in 0..<20 {
            let btn = FuncButton()
            //先add再自动布局
            self.addSubview(btn)
            btn.snp.makeConstraints(){ maker in
                let IS_THE_FIRST_OF_ROW: Bool = index%4 == 0
                let IS_THE_FIRST_ROW: Bool = index/4 == 0
                //left
                if IS_THE_FIRST_OF_ROW {
                    maker.left.equalTo(0)
                }else {
                    maker.left.equalTo(frontBtn.snp.right)
                }
                //bottom
                if IS_THE_FIRST_ROW {
                    maker.bottom.equalTo(0)
                }else if IS_THE_FIRST_OF_ROW{
                    maker.bottom.equalTo(frontBtn.snp.top)
                }else {
                    maker.bottom.equalTo(frontBtn.snp.bottom)
                }
                
                //按钮大小，使得在父视图中可以5x4刚好占满
                maker.width.equalTo(btn.superview!.snp.width).multipliedBy(0.25)
                maker.height.equalTo(btn.superview!.snp.height).multipliedBy(0.2)
            }
            
            btn.tag = index+100
            btn.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            btn.setTitle(dataArray[index], for: UIControl.State.normal)
            
            frontBtn = btn
        }//for
    }//installUI
    
    @objc func btnClick(button: FuncButton){
        if delegate != nil {
            delegate?.boardButtonClick(content: button.currentTitle!)
            print("点击：\(button.currentTitle!)")
        }
        
    }
    
    required init?(coder: NSCoder) {//UIView子类必须实现的构造方法
        fatalError("init(coder:) has not been implemented")
    }
    
}
