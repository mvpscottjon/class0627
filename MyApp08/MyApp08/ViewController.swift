//
//  ViewController.swift
//  MyApp08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit


//tableView 拉去給ViewController做 所以viewController需要實作這兩個protocal
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func backHere(segue: UIStoryboardSegue) {
    
    print("back home")
    }
    
    
    private let mydata = ["猜數字v1", "猜數字v2","切換場景","自訂view(X)", "簽名板", "自訂cell的tableView","練習touch事件","Item3","Item1", "Item2","Item4","Item3","Item1", "Item2","Item4","Item3"]
    
    //show幾筆資料
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.count
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //一開始var的變數
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
            cell?.textLabel?.text = mydata[indexPath.row]
        print(indexPath)
        return cell!
    }
    
    
    
    
    
    //觸發選項 ==>indexPath.row
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
        gotoVC(whereVC: indexPath.row)
    }
    
    
    private func gotoVC(whereVC: Int) {
        switch  (whereVC) {
        case 2:
            if let vc2 = storyboard?.instantiateViewController(withIdentifier: "vc2") {
                show(vc2, sender: self)
            }
            
        case 4:
            if let paintervc = storyboard?.instantiateViewController(withIdentifier: "paintervc") {
                show(paintervc, sender: self)
            }
            
            
            
        case 5:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "customcellvc") {
            show(vc, sender: self)
                }
        case 6:
            if let vc = storyboard?.instantiateViewController(withIdentifier: "touchvc") {
                show(vc, sender: self)
            }
            
            break
            default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    

}
