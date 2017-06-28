////
////  TestTouchView.swift
////  MyApp08
////
////  Created by user on 2017/6/26.
////  Copyright © 2017年 seven. All rights reserved.
////
//
//import UIKit
//
//class TestTouchView: UIView {
//    
//    var isInitStat = false
//    private var ttvc:testTouchVC?
//    
//    private func initState() {
//        isInitStat = true
//        
//        //第一招
//        //        let vc = findSuperVC(whichView: self)
//        //        ttvc = vc as! testTouchVC
//        //        //找不到 print 不出 123????
//        //        print(ttvc!.a)
//        
//        //第二種方法 找出父類別？ 也找不到 要除錯
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        ttvc = storyboard.instantiateViewController(withIdentifier: "touchvc") as! testTouchVC
//        print(ttvc!.a)
//        
//        
//    }
//    
//    
//    
//    
//    
//    //find Super Container
//    private func findSuperVC( whichView: UIView) ->UIViewController? {
//        
//        //第一招用的
//        //下變上 自動轉型
//        var responder:UIResponder = whichView
//        while responder != nil {
//            print("ok")
//            
//            if let vc = responder as?  //這邊要用"?"
//                UIViewController {
//                
//                return vc
//            }
//            responder = responder.next!
//        }
//        return nil
//    }
//    
//    
//    
//    
//    //    override func draw(_ rect: CGRect) {
//    //
//    //        //不能再draw放  應該要outlet view 在vc 或改draw的建構式
//    ////        backgroundColor = UIColor(colorLiteralRed: 1, green: 1, blue: 0, alpha: 1)
//    //
//    //
//    //
//    //    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("MyView:touchesBegan")
//        ttvc?.touchesBegan(touches , with: event)
//    }
//    
//    
//    
//}
