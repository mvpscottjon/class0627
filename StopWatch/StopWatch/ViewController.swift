//
//  ViewController.swift
//  StopWatch
//
//  Created by Seven Tsai on 2017/6/27.
//  Copyright © 2017年 Seven Tsai. All rights reserved.
//



////**********碼表計時器
import UIKit

class ViewController: UIViewController, UITabBarDelegate , UITableViewDataSource {


    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var hsLabel: UILabel!
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var btnStartOrStop: UIButton!
    @IBOutlet weak var btnLapOrReset: UIButton!
    private var isStart = false
    private var laps:Array<String> = []
    private var timer:Timer?
    private var counter = 0
    private var counterS = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        //若為自訂view 還要強制轉型
        cell?.textLabel?.text = laps[indexPath.row]  //cell 預設有一個label 一個image
        return cell!
    }
    
    
    
    @IBAction func changeStartOrStop(_ sender: Any) {
            isStart = !isStart
        if isStart {
            //runnung
            btnStartOrStop.setTitle("Stop", for: UIControlState.normal)
            btnLapOrReset.setTitle("Lab", for: UIControlState.normal)
            doStart()
        }else {
            btnStartOrStop.setTitle("Start", for: UIControlState.normal)
            btnLapOrReset.setTitle("Reset", for: UIControlState.normal)
            doStop()
        }
    }
    @IBAction func doRestOrLap(_ sender: Any) {
        if isStart {
            //runnung ==> Lap
            doLap()
        }else {
            //stop ==>reset
            doRest()
        }
    }
    
    private func doStart(){
        //單位為秒
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: {
            (timer) in
            
            self.counter += 1
            self.showCounter()
        })
    }
    private func showCounter(){
        hsLabel.text = String(counter % 100)
           let ts =  counter / 100
        secondLabel.text = String(ts % 60)
        let tm = ts / 60
        minuteLabel.text = String(tm % 60)
        hourLabel.text = String(tm / 60)
        
//        hsLabel.text = String(counter)
//        if counter > 99 {
//            counterS += 1
//            counter = 0
//        }
    }
    
    
    private func doStop(){
        //結束timer
        timer?.invalidate()
        //好習慣
        timer = nil
    }
    private func doRest(){
        counter = 0
        laps = []
        showCounter()
         tabelView.reloadData()
    }
    private func doLap(){
        let lapString = hourLabel.text! + ":" + minuteLabel.text! + ":" + secondLabel.text! + "." + hsLabel.text!
        laps += [lapString]
        tabelView.reloadData()  //資料整合 觸發 func tableview那兩個方法
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCounter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

