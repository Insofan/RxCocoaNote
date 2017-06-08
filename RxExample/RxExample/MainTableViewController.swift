//
//  ViewController.swift
//  RxExample
//
//  Created by 海啸 on 2017/2/1.
//  Copyright © 2017年 海啸. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    fileprivate let reuseCell = "reuseIdentifier"
    
    fileprivate let controllerArray : NSArray = [AddNumberViewController()]
    
    fileprivate let titleArray : NSArray = ["Add Number"]
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.red
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier:self.reuseCell)
    }
    
    //MARK: Table Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: self.reuseCell)
        cell.textLabel?.text = (titleArray[indexPath.row] as? String)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.blue
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(self.controllerArray[0] as! UIViewController, animated: true)
            
        }
    }
    
    
}

