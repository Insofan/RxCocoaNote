

//
//  AddNumberViewController.swift
//  RxExample
//
//  Created by 海啸 on 2017/2/1.
//  Copyright © 2017年 海啸. All rights reserved.
//

import UIKit
import RxCocoa
import SnapKit
import RxSwift
import RxDataSources
class AddNumberViewController: UIViewController {
    
    fileprivate let number1 : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    fileprivate let number2 : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    fileprivate let number3 : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    fileprivate let resultLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.textColor       = UIColor.blue
        label.text            = "Result"
        label.textAlignment   = NSTextAlignment.center
        return label
    }()
    
    func setupTextField () {
        let numberFieldArray = [self.number1, self.number2, self.number3]
        
        for i in 0...2{
            self.view.addSubview(numberFieldArray[i])
            numberFieldArray[i].placeholder = "number\(i+1)"
            numberFieldArray[i].snp.makeConstraints({ (make) in
                make.top.equalToSuperview().offset(Double(i+1)*100.0)
                make.centerX.equalToSuperview()
                make.size.equalTo(CGSize(width: 150, height: 30))
            })
        }
       
        self.view.addSubview(self.resultLabel)
        
        self.resultLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.number3.snp.bottom).offset(100)
            make.size.equalTo(self.number3)
            make.centerX.equalTo(self.number3)
        }
        
    }
    
    override func viewDidLoad() {
        self.setupTextField()
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.title = "Add Number"
        // Do any additional setup after loading the view.
        
        Observable.combineLatest(self.number1.rx.text.orEmpty, self.number2.rx.text.orEmpty, self.number3.rx.text.orEmpty) {number1 , number2, number3 -> Int in
           return (Int(number1) ?? 0) + (Int(number2) ?? 0) + (Int(number3) ?? 0)
            }.map { $0.description }
            .bindTo(self.resultLabel.rx.text)
    }

   

}
