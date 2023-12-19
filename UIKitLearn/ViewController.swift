//
//  ViewController.swift
//  UIKitLearn
//
//  Created by 江佳谊 on 2023/12/18.
//

import UIKit
//
//可看作各个组件的容器
//同时作为代理，实现了业务，而对象本身不必知道业务细节
//
class ViewController: UIViewController, BoardButtonInputDelegate {
    
    let board = Board()
    let screen = Screen()
    let calculate = CalculateEngine()
    var isDone: Bool = false
    
    func boardButtonClick(content: String) {
        print("输入：\(content)")
        if content == "AC" || content == "Delete" || content == "=" {
            switch(content){
            case "AC":
                screen.clear()
                screen.refresh()
            case "Delete":
                screen.retreat()
            case "=":
                let result = calculate.calculatEquation(equation: screen.inputStr)
                screen.refresh()
                screen.clear()//把输入清空，用于显示结果
                screen.inputContent(content: String(result))
                isDone = true
            default:
                screen.refresh()
                break
            }
        }else {
            if isDone {
                screen.clear()
                isDone = false
            }
            screen.inputContent(content: content)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        installUI()
    }
    
    func installUI() {
        board.backgroundColor = UIColor.black
        screen.backgroundColor = UIColor.gray
        self.view.addSubview(board)
        self.view.addSubview(screen)
        board.delegate = self
       
        board.snp.makeConstraints() { maker in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.bottom.equalTo(0)
            maker.height.equalTo(self.view).multipliedBy(2/3.0)
        }
        
        screen.snp.makeConstraints() { maker in
            maker.left.equalTo(0)
            maker.right.equalTo(0)
            maker.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        }
    }
}

