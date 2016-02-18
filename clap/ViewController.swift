//
//  ViewController.swift
//  clap
//
//  Created by 共田 恭輔 on 2016/01/17.
//  Copyright © 2016年 共田 恭輔. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    @IBOutlet var clapPickerView : UIPickerView!
    
    var audioPlayer:AVAudioPlayer!
    var soundcount :Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //再生する音楽のURLを生成
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath:soundFilePath)
        
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
        
        // AVAudioPlayerのインスタンス化
        audioPlayer = try? AVAudioPlayer(contentsOfURL: fileURL)
    }
    
    //いくつカテゴリーを持つか
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //いくつ選択肢をつくるか
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10 }
    //選択肢になにを表示していくか1
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundcount = row
    }
    
    @IBAction func playbt(){
        audioPlayer.numberOfLoops = soundcount
        audioPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
    }
    
    
    
}

