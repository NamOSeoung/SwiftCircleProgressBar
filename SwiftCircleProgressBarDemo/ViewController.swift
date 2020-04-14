//
//  ViewController.swift
//  SwiftCircleProgressBarDemo
//
//  Created by Zoe Liu on 2019/8/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: CircleProgress!
    var currentProgress: Float = 0.00
    
    //timer
    var mTimer : Timer?
    var number : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        progressBar.progress = CGFloat(currentProgress)
        timerStart()
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func increaseProgress(_ sender: Any) {
        currentProgress = Float.minimum(1.0, currentProgress + 0.002)
        progressBar.progress = CGFloat(currentProgress)
    }
    
    @IBAction func decreaseProgress(_ sender: Any) {
        currentProgress = Float.maximum(0, currentProgress - 0.1)
        progressBar.progress = CGFloat(currentProgress)
    }
    
    func timerStart(){
         if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작한다
            if !timer.isValid {
                /** 1초마다 timerCallback함수를 호출하는 타이머 */
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        }else{
            //timer 객체가 nil 인 경우에 객체를 생성하고 타이머를 시작한다
            /** 1초마다 timerCallback함수를 호출하는 타이머 */
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    func timerStop(){
       if let timer = mTimer {
            if(timer.isValid){
                timer.invalidate()
            }
        }
        
        number = 0
//        txtTime.text = String(number)
    }
    //타이머가 호출하는 콜백함수
    @objc func timerCallback(){
        number += 1
        print(number)
        currentProgress = Float.minimum(1.0, currentProgress + 0.003333)
        progressBar.progress = CGFloat(currentProgress)
//        txtTime.text = String(number)
    }

}

