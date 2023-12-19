//
//  Screen.swift
//  UIKitLearn
//
//  Created by 江佳谊 on 2023/12/18.
//

import Foundation
import SnapKit
import UIKit

class Screen: UIView {
    var input: UILabel?
    var inputStr: String = ""
    
    var history: UILabel?
    var historyStr: String = ""
    
    let figureArray: Array<Character> = [
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "."
    ]
    
    let funcArray: Array<Character> = [
        "+",
        "-",
        "x",
        "/",
        "%",
        "^"
    ]
    
    init() {
        input = UILabel()
        history = UILabel()
        super.init(frame: CGRect.zero)
        installUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installUI() {
        input?.textAlignment = .right
        history?.textAlignment = .right
        
        input?.font = UIFont.systemFont(ofSize: 34)
        history?.font = UIFont.systemFont(ofSize: 30)
        
        input?.textColor = UIColor.orange
        history?.textColor = UIColor.black
        
        input?.adjustsFontSizeToFitWidth = true
        history?.adjustsFontSizeToFitWidth = true
        
        input?.minimumScaleFactor = 0.5
        history?.minimumScaleFactor = 0.5
        //"...114514"
        input?.lineBreakMode = .byTruncatingHead
        history?.lineBreakMode = .byTruncatingHead
        
        input?.numberOfLines = 0
        history?.numberOfLines = 0
        
        self.addSubview(input!)
        self.addSubview(history!)
        
        //自动布局
        input?.snp.makeConstraints() { maker in
            maker.left.equalTo(110)
            maker.right.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.height.equalTo(input!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        }
        
        history?.snp.makeConstraints() { maker in
            maker.left.equalTo(110)
            maker.right.equalTo(-10)
            maker.top.equalTo(10)
            maker.height.equalTo(input!.superview!.snp.height).multipliedBy(0.5).offset(-10)
        }
    }
    
    //MARK: -func
    
    //输入
    func inputContent(content: String) {
        if !figureArray.contains(content.last!) && !funcArray.contains(content) {
            print("非法输入:\(content)")
            return
        }
       
        let NEXT_IS_FUNC: Bool = funcArray.contains(content.last!)
        let NEXT_IS_FIGURE: Bool = figureArray.contains(content.last!)

        
        if inputStr.count>0 {
            
            let INPUT_IS_FUNC: Bool = funcArray.contains(inputStr.last!)
            let INPUT_IS_FIGURE: Bool = figureArray.contains(inputStr.last!)
            
            if INPUT_IS_FIGURE {
                inputStr.append(content)
                input!.text = inputStr
            }else if INPUT_IS_FUNC {
                if NEXT_IS_FIGURE{
                    inputStr.append(content)
                    input!.text = inputStr
                }else if NEXT_IS_FUNC{
                    //不允许输入运算符
                    print("不允许连续输入运算符")
                }
            }
        }else {
            if NEXT_IS_FIGURE {//不允许运算符开头
                inputStr.append(content)
                input?.text = inputStr
            }
        }
    }
    
    func refresh() {
        historyStr = inputStr
        history?.text = historyStr
    }
    
    func clear() {
        inputStr = ""
        input?.text = ""
    }
    
    func retreat() {
        guard inputStr != ""
        else{return}
        inputStr.remove(at: inputStr.index(before: inputStr.endIndex))
        
        input?.text = inputStr
    }
}
