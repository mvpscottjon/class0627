//
//  ViewController.swift
//  MyApp10
//
//  Created by Seven Tsai on 2017/6/27.
//  Copyright © 2017年 Seven Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var keyAccount: UITextField!
    
    
    @IBOutlet weak var keyPasswd: UITextField!
    
    @IBAction func getJSON(_ sender: Any) {
        
        do {
            
                        let url = URL(string: "http://data.coa.gov.tw/Service/OpenData/ODwsv/ODwsvTravelFood.aspx")
                        let data = try Data(contentsOf: url!)

                        //let source = try String(contentsOf: url!, encoding: String.Encoding.utf8)
                        parseJSON(json: data)
//                        print(source)
                    }catch {
                        print("OKOK")
                      
                        print(error)
                    }
        
        
    }
    
    private func parseJSON(json: Data){
        // analize JSON
        //allow 有 throw 要做try
        
        do{
            if let jsonObj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments) {
//                print(type(of: jsonObj))
                
                let allObj = jsonObj as! [[String: AnyObject]]
                
                for r in allObj {
                    print(r["Address"] as! String)
                }
                
//                for r in jsonObj as! [[String: AnyObject]] {
//                    print(r["Name"] as! String)
//                }
                
            }
        }catch {
            print(error)
        }
    }
    
    
    
    @IBAction func getImage(_ sender: Any) {
        
        //存取圖檔。建議再執行緒執行
        
        DispatchQueue.global().async {
            self.fetchImage()
        }
        
        
        
    
    }
    
    private func fetchImage() {
        
        do{
            
            
            let url = URL(string: "https://behlerblog.files.wordpress.com/2012/05/mr-nobody.jpg")
            
            //非 nil才執行
            if url != nil {
                
                
                //            print(url.debugDescription)
                let data = try Data(contentsOf: url!)
                
                //            print(data.debugDescription)
                let img = UIImage(data: data)
//                imgView.image = img
                //組序  show 圖 要以disQ main
                DispatchQueue.main.async {
                    self.imgView.image = img
                }
                
            }else {
                let img = UIImage(named: "ball")
//                imgView.image = img
                DispatchQueue.main.async {
                    self.imgView.image = img
                }
            }
        }catch {
            let img = UIImage(named: "ball")
            imgView.image = img
        }
        
    
    }
    
    
    
    
    @IBAction func testGet(_ sender: Any) {
        do {
            let account = keyAccount.text
            let passwd = keyPasswd.text
            let urlString = "http://127.0.0.1/test.php?account=\(account!)&passwd=\(passwd!)"
            let url = URL(string: urlString)
            
            let source = try String(contentsOf: url!, encoding: String.Encoding.ascii)
           
            if source == "OK"{
                print("add OK")
            
            }else {
                print("add fail")
            
            }
        }catch {
            print("OKOK")
            
            print(error)
        }
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //string URL

        
        
        //try catch
//        do {
//            //Transport Security has blocked a cleartext HTTP
//            //非https 無法開啟  需另外開啟組態才可以開啟
////            let url =  URL(string: "http://www.iii.org.tw/")
//            let url = URL(string: "https://www.google.com/")
//            
//            let source = try String(contentsOf: url!, encoding: String.Encoding.ascii)
////            let source = try String(contentsOf: url!)
//            print(source)
//        }catch {
//            print("OKOK")
//            //處理例外 try的錯誤
//            print(error)  //預設error 物件
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

