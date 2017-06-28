//
//  VC2.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit

class VC2: UIViewController {

    @IBOutlet weak var labelRand: UILabel!
    
    @IBOutlet weak var labelApp: UILabel!
    private let rand = Int(arc4random_uniform(49))
    
    @IBAction func govc3(_ sender: Any) {
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "vc3")
        show(vc3!, sender: self)
        
        
    }
    
    @IBAction func govc4(_ sender: Any) {
        let vc4 = storyboard?.instantiateViewController(withIdentifier: "vc4")
        show(vc4!, sender: self)
    
    
    }
    
    
    
    
    
    override func viewDidLoad() {
        
        //跳到別隻 再跳回來 會在執行一次
        super.viewDidLoad()
        labelRand.text = String(rand)
        print("VC2:viewDidLoad()")
        
        //取得AppDelegate 的資料
        //原ios委託 delegate執行app  現在要轉型為我們訂的AppDelegate
        let app = UIApplication.shared.delegate as! AppDelegate
        
        labelApp.text = String(app.rand)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
