//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by 山坂駿 on 2022/03/26.
//

import UIKit
import AVFoundation // 音を扱いやすくしてくれるフレームワークを宣言

class SoundPlayer: NSObject {
    // シンバルの音源データを読み込み
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    
    // シンバル用プレイヤーの変数
    var cymbalPlayer: AVAudioPlayer!
    
    // ギターの音源データを読み込み
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    
    // ギター用プレイヤーの変数
    var guitarPlayer: AVAudioPlayer!
    
    // シンバルを鳴らすメソッド
    func cymbalPlay(){
        do{
            // シンバル用のプレイヤーに、音源データを指定
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
        }catch{
            print("シンバルで、エラーが発生しました")
        }
        // シンバルの音源再生
        cymbalPlayer.play()
    }
    
    func guitarPlay(){
        do{
            // ギター用のプレイヤーに、音源データを指定
            guitarPlayer = try AVAudioPlayer(data: guitarData)
        }catch{
            print("ギターで、エラーが発生しました。")
        }
        // ギターの音源再生
        guitarPlayer.play()
    }
}
