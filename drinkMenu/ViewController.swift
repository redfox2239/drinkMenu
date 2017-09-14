//
//  ViewController.swift
//  drinkMenu
//
//  Created by 原田　礼朗 on 2017/09/14.
//  Copyright © 2017年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var type = "category"
    
    var categorySelectIndex = 0
    var drinkSelectIndex = 0
    
    var category = [
        "Zoffe &Espeesso",
        "Frappuccino",
        "ジュース",
        "ホットティー",
    ]
    
    var drink = [
        [
            ("ドリップコーヒー",[280,320,360,420]),
            ("ラテ",[300,320,380,440]),
            ("キャラメルマキアート",[300,320,380,440]),
        ],
        [
            ("マカフラペチーノ",[280,320,360,420]),
            ("キャラメルフラペチーノ",[300,320,380,440]),
            ("抹茶フラペチーノ",[350,380,480,440]),
        ],
        [
            ("オレンジ",[280,320,360,420]),
            ("グレーピーグレープ＆ティー",[300,320,360,440]),
            ("ゆずシトラス",[280,320,360,420]),
        ],
        [
            ("ユースベリー",[280,320,360,420]),
            ("イングリッシュブレックファースト",[280,320,360,420]),
            ("ハイビスカスティー",[280,320,360,420]),
            ("カモミール",[280,320,360,420]),
        ],
    ]
    
    var size = ["S:","M:","L:","G:"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if type == "category" {
            return category.count
        }
        else if type == "drink" {
            return drink[categorySelectIndex].count
        }
        else {
            return drink[categorySelectIndex][drinkSelectIndex].1.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var data = ""
        if type == "category" {
            data = category[indexPath.row]
        }
        else if type == "drink" {
            data = drink[categorySelectIndex][indexPath.row].0
        }
        else {
            data = size[indexPath.row].appending(String(drink[categorySelectIndex][drinkSelectIndex].1[indexPath.row]))
        }
        cell.textLabel?.text = data
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! ViewController
        if type == "category" {
            next.type = "drink"
            next.categorySelectIndex = indexPath.row
        }
        else if type == "drink" {
            next.type = "price"
            next.categorySelectIndex = categorySelectIndex
            next.drinkSelectIndex = indexPath.row
        }
        else {
            return
        }
        show(next, sender: nil)
    }

}

