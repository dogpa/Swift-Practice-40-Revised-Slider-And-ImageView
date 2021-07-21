//
//  ViewController.swift
//  Swift Practice # 40 Slider And ImageView
//
//  Created by CHEN PEIHAO on 2021/7/21.
//

import UIKit
//引入AVFoundation播放音樂使用
import AVFoundation

class ViewController: UIViewController {
    
    //定義一個AVPlayer()功能給musicPlayer
    let musicPlayer = AVPlayer()
    //移動距離的slider
    @IBOutlet weak var changDistantSlider: UISlider!
    //寶貝球的UIImageView
    @IBOutlet weak var ballImageView: UIImageView!
    //小智的UIImageView
    @IBOutlet weak var chiImageView: UIImageView!
    //皮卡丘的UIImageView
    @IBOutlet weak var pikaImageView: UIImageView!


    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chiImageView.alpha = 0
    }
    
    //寶貝球與皮卡丘的移動
    @IBAction func catchBattle(_ sender: UISlider) {
        chiImageView.alpha = 0
        let distant = sender.value
        ballImageView.frame.origin.x = CGFloat(60+distant)
        ballImageView.alpha = CGFloat(1.2-(distant/330))
        pikaImageView.frame.origin.x = CGFloat(720-distant)
        pikaImageView.alpha = CGFloat(1.2-(distant/330))
        
        
        if distant > 329 {
            if musicPlayer.rate != 0 {
            let startMusic = Bundle.main.url(forResource: "pikaroar", withExtension: ".mp3")!
            let playMusic = AVPlayerItem(url: startMusic)
            musicPlayer.replaceCurrentItem(with: playMusic)
            musicPlayer.play()
            chiImageView.alpha = 1
            } else if musicPlayer.rate == 0{
                
            }
        }
        
        if sender.value > 0 || sender.value < 330 {
            if musicPlayer.rate == 0{
                let startMusic = Bundle.main.url(forResource: "battle", withExtension: ".mp3")!
                let playMusic = AVPlayerItem(url: startMusic)
                musicPlayer.replaceCurrentItem(with: playMusic)
                musicPlayer.play()
            }
        }
        
        /*
        if musicTurnOnSwitch.isOn == true {
            let startMusic = Bundle.main.url(forResource: "battle", withExtension: ".mp3")!
            let playMusic = AVPlayerItem(url: startMusic)
            musicPlayer.replaceCurrentItem(with: playMusic)
            musicPlayer.play()
            if sender.value > 0 {
                musicTurnOnSwitch.isOn = false
            }
            }
        if musicTurnOnSwitch.isOn == false{
            if sender.value == 0 {
                musicTurnOnSwitch.isOn = true
            }
        }
        */
        
        }
    }
    

