//
//  CustomCellViewController.swift
//  MyApp08
//
//  Created by user on 2017/6/22.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let mydata = ["Item4","Item3","Item1", "Item2","Item4","Item3","Item1", "Item2","Item4","Item3"]
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.count
    }
    
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        //要轉型為自訂的CustonTableViewCell  為 UITableView的子類別
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell")
        as! CustomTableViewCell
        //圖片名字
        cell.apple.image = UIImage(named: "images.jpeg")
        cell.label1.text = mydata[indexPath.row]
        cell.label2.text = "1234567"
        cell.apple.layer.cornerRadius = 80
        cell.apple.clipsToBounds = true
        return cell
        
        
    }
    
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
