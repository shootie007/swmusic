//
//  ViewController.swift
//  MyMusic
//
//  Created by 多田秀人 on 2020/09/04.
//  Copyright © 2020 多田秀人. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // path for mp3 files
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    // player instances
    var cymbalPlayer = AVAudioPlayer()
    var guitarPlayer = AVAudioPlayer()
    var backmusicPlayer = AVAudioPlayer()
    
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }∑
    
    @IBAction func stop(_ sender: Any) {
        // stop bgm
        backmusicPlayer.stop()
    }
    
    // common player
    fileprivate func soundPlayer(player:inout AVAudioPlayer, path: URL, count: Int) {
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました！")
        }
    }
}

