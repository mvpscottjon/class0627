//
//  ViewController.swift
//  MyApp09
//
//  Created by user on 2017/6/26.
//  Copyright © 2017年 seven. All rights reserved.
//
//*********執行緒
import UIKit

class ViewController: UIViewController {

    private var a = 0
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBAction func test1(_ sender: Any) {
        
        //main
//        let q = DispatchQueue.main
//        
//        //非同步
//        q.async {
//            self.task1()
//        }
//        q.async {
//            self.task2()
//        }
        //global
//        DispatchQueue.global().async {
//            self.task1()
//        }
//        DispatchQueue.global().async {
//            self.task2()
//        }
        
        
        
        
//        //global sync  做完1 才能換2
//        DispatchQueue.global().async {
//            self.task1()
//        }
//        DispatchQueue.global().async {
//            self.task2()
//        }
        
        //global mix
//        DispatchQueue.global().async {
//                        self.task1()
//                    }
//        DispatchQueue.global().sync {
//            self.task2()
//        }
//        DispatchQueue.global().async {
//                self.task3()
//            }
        //label   global 無法處理UI  要用global 包 main的func
        DispatchQueue.global().async {
            self.task1()
//            DispatchQueue.main.async {
//                self.task1()
        }
        
        
    }
    
    
    
    
    
    
    @IBAction func test4(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in
            self.task4()
//            self.task2()
        
        })
    }
    
    
    func task4() {
        if a < 10 { a += 1
        label1.text = String(a)
        }else {a = 0}
    }
    
    
    
    
    
    
    func task1() {
        for i in 1...10 {
        print("A\(i)")
//            sleep(1)
            usleep(200 * 1000)
            
            //for show all text
            DispatchQueue.main.async {
                self.label1.text = String(i)

            }
        }
    }
        func task2() {
            for i in 11...20 {
                print("B\(i)")
//                sleep(1)
                usleep(200 * 1000)
                DispatchQueue.main.async {
                    self.label2.text = String(i)
                    
                }
            }
    }
    
    func task3() {
        for i in 21...30 {
            print("C\(i)")
            //                sleep(1)
//            usleep(200 * 1000)

        }
    }
    
    
    
    
    @IBAction func test2(_ sender: Any) {
//        DispatchQueue.main.async {
//            self.task2()
//        }
        DispatchQueue.global().async {
            self.task2()
        }
    }
    
    @IBAction func test3(_ sender: Any) {
        
        //OperationQueue 同時
        let opq = OperationQueue()
        opq.addOperation {
            for i in 1...100 {
                sleep(1)
                DispatchQueue.main.async {
                    self.label1.text = String(i)
                }
            }
        }
        opq.addOperation {
            for i in 1...100 {
                sleep(1)
                DispatchQueue.main.async {
                    self.label2.text = String(i)
                }
        }
        
        
        
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label1.text = String(100)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

