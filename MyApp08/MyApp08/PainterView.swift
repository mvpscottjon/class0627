//
//  PainterView.swift
//  MyApp08
//
//  Created by user on 2017/6/23.
//  Copyright © 2017年 seven. All rights reserved.
//

import UIKit

class PainterView: UIView {

    //CGRect 的高寬
    private var viewW:CGFloat = 0
    private var viewH:CGFloat = 0
    
//    //一條線
//    private var line:Array<(CGFloat,CGFloat)> = []
   
    //多條線
    private var lines:Array<Array<(CGFloat,CGFloat)>> = [[]]
        // 資源回收桶  有undo 才可以redo
    private var recycle:Array<Array<(CGFloat,CGFloat)>> = [[]]
    private var isInit = false
    private var context:CGContext?
    private var ballW:CGFloat?
    private var ballH:CGFloat?
    private var ballX:CGFloat = 1
    private var ballY:CGFloat = 1
    private var dX:CGFloat = 2
    private var dY:CGFloat = 2
    private var ballImg = UIImage(named: "ball")
    private var i = 1

    //只做一次的可以放在這邊 或 計算的事 為了效能好
    private func initState(_ rect:CGRect){
    
        isInit = true
        viewW = rect.size.width
        viewH = rect.size.height
       context = UIGraphicsGetCurrentContext()
        ballW = ballImg?.size.width
        ballH = ballImg?.size.height
        
        
        Timer.scheduledTimer(withTimeInterval: 0.002, repeats: true, block: {
            (timer) in
            self.refrashView()
        })
    }
    
    func refrashView() {
        i += 1
        if i % 2 == 0 {
        moveball()
        }
        
        setNeedsDisplay()
    }
    
    
    func moveball() {
        if ballX < 0 || ballX + ballW! > viewW {
            dX *= -2
        }
        if ballX < 0 || ballY + ballH! > viewH {
            dY *= -2
        }
        ballX += dX
        ballY += dY
    
    }
    
    //呈現外觀 draw
    override func draw(_ rect: CGRect) {
        if !isInit {initState(rect)}
        
        //球
        
         ballImg?.draw(in: CGRect(x: ballX, y: ballY, width: ballW!, height: ballH!))
        
        
        
        //第二招context 放圖  但會顛倒？？？
//        
//        var img = UIImage(named: "images.jpeg")
//        var imgW = img?.size.width
//        var imgH = img?.size.height
//        let imgCG = img?.cgImage
//        
//        context?.draw(imgCG!, in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
        
        //第三招
//        var img = UIImage(named: "images.jpeg")
//        var imgW = img?.size.width
//        var imgH = img?.size.height
//
//        img?.draw(in: CGRect(x: 0, y: 0, width: imgW!, height: imgH!))
        
        
        
            //移去call and review
//        viewW = rect.size.width
//        viewH = rect.size.height
//
//        print("W:\(viewW) H:\(viewH)")
        
    //取得context
        //搬到 initState
//        let context:CGContext? = UIGraphicsGetCurrentContext()
    context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        //三點兩條線  四點三條線 所以用1開始
        
        
        
        //每條線
        for j in 0..<lines.count {
            if lines[j].count <= 1 {continue}
        //內層尋訪每個點
            for i in 1..<lines[j].count {
                let (p0x, p0y) = lines[j][i-1]
                let (p1x, p1y) = lines[j][i]
                
                context?.move(to: CGPoint(x: p0x, y: p0y))
                context?.addLine(to: CGPoint(x: p1x, y: p1y))
                context?.drawPath(using: CGPathDrawingMode.stroke)
            }
           
            
            
   //  自己try的
//        context?.addRect(CGRect(x: 0, y: 0, width: 100, height: 100))
//        context?.drawPath(using: CGPathDrawingMode.fillStroke)
//        
        }
//            //建立圖片 在UIView 底下 建立一個 subView
//        var img = UIImage(named: "images.jpeg")
//        var imgW = img?.size.width
//        var imgH = img?.size.height
//        //建立 圖片view with 圖片
//        var temp = UIImageView(image: img)
//        temp.frame = CGRect(x: 0, y: 0, width: imgW!, height: imgH!)
//        
//        addSubview(temp)
        
        
        
        
    }
    //touch event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("down")
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self) //有可能在其他UIview
        //後面加的 因為畫新的一條線時 要把資源回收桶清空 
        

        
        lines += [[]]
        
        lines[lines.count-1] += [(point.x, point.y)]
        
        recycle = [[]]
        
//        line += [(point.x,point.y)]
//        print("\(point.x) x \(point.y)")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("move")
        
            let touch:UITouch = touches.first!
            let point:CGPoint = touch.location(in: self)
//                line += [(point.x,point.y)]
        //重新繪製draw
        lines[lines.count-1] += [(point.x, point.y)]
        setNeedsDisplay()
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("up")
        let touch:UITouch = touches.first!
        let point:CGPoint = touch.location(in: self)
//        line += [(point.x,point.y)]
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func clear(){
        //清空線們
        lines = [[]]
        recycle = [[]]
        //重新顯示
        setNeedsDisplay()
    
    }
    
    
   
    
    func undo() {
        if lines.count > 0 {
            //清除最後一條
//            lines.remove(at: lines.count-1)
     
            //清空同時有記錄下來
            recycle += [lines.remove(at: lines.count-1)]
            
            
            
            setNeedsDisplay()
        }
    }
    
    func redo() {
        if recycle.count > 0 {
            lines += [recycle.remove(at: recycle.count-1)]

            setNeedsDisplay()
        
        
        }
    }
    
    

}
