////
////  testTouchVC.swift
////  MyApp08
////
////  Created by user on 2017/6/26.
////  Copyright © 2017年 seven. All rights reserved.
////
//
//import UIKit
//
//class testTouchVC: UIViewController {
//    
//    @IBOutlet weak var myView: TestTouchView!
//    var a = 321
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        myView.backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
//        
//        //手勢
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapTest))
//        //單擊
//        tapGesture.numberOfTapsRequired = 1
//        //兩隻手指
//        tapGesture.numberOfTouchesRequired = 2
//        myView.addGestureRecognizer(tapGesture)
//        
//        
//        
//        
//        //合再一起的手勢  pinch 放大縮小
//        
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchTest))
//        myView.addGestureRecognizer(pinchGesture)
//        
//        //rotation
//        let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotationTest))
//        myView.addGestureRecognizer(rotationGesture)
//        
//        
//        //swipe  沒寫完 藥補
//        //        let swipGesture = UISwipeGestureRecognizerDirection(target: self, action: #selector(swipeTest))
//        //
//        //
//        //
//        //        swipeGesture.direction = UISwipeGestureRecognizerDirection.right
//        //        swipeGesture.numberOfTouchesRequired = 1
//        //        myView.addGestureRecognizer(swipeGesture)
//        
//        
//    }
//    
//    
//    //這邊是方法
//    
//    @objc func tapTest(_ sender : UITapGestureRecognizer) {
//        
//        print("two finger touch")
//        
//        //觸碰點
//        //可利用 sender.numberOfTouches 寫迴圈
//        //        print(" point number = \(sender.numberOfTouches)")
//        
//        //第0點
//        let p0 = sender.location(ofTouch: 0, in: sender.view)
//        print("0. \(p0.x) x \(p0.y)")
//        let p1  = sender.location(ofTouch: 1, in: sender.view)
//        print("0. \(p1.x) x \(p1.y)")
//        
//    }
//    
//    @objc func pinchTest(_ sender: UIPinchGestureRecognizer) {
//        if sender.state == UIGestureRecognizerState.changed {
//            print(sender.scale)  //1為基準數  大於放大 小於縮小
//            print("pinch")
//            
//        }
//        
//    }
//    @objc func rotationTest(_ sender: UIRotationGestureRecognizer) {
//        
//        let rad = sender.rotation
//        let deg = Float(rad) * Float(180) / Float(M_PI)
//        
//        if deg > 0 {
//            print("順:\(deg)")
//        }else {
//            print("逆:\(deg)")
//        }
//        
//        
//        
//    }
//    //swipe  沒寫完 藥補
//    @objc func swipeTest(_ sender: UISwipeGestureRecognizerDirection) {
//        
//        //        switch sender.direction {
//        //        case UISwipeGestureRecognizerDirection.right:
//        //            print("r")
//        //        case UISwipeGestureRecognizerDirection.up:
//        //            print("u")
//        //        case UISwipeGestureRecognizerDirection.down:
//        //            print("d")
//        //        case UISwipeGestureRecognizerDirection.left:
//        //            print("l")
//        //        default:
//        //            break
//        //
//        //        }
//        
//    }
//    //    //外面的VC touch event
//    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //        print("VC:touch")
//    //    }
//    
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    /*
//     // MARK: - Navigation
//     
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destinationViewController.
//     // Pass the selected object to the new view controller.
//     }
//     */
//    
//}
