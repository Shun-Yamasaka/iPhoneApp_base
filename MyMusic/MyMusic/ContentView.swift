//
//  ContentView.swift
//  MyMusic
//
//  Created by 山坂駿 on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    // 音を鳴らすためのSoundPlayerクラスのインスタンス生成
    let soundPlayer = SoundPlayer()
    var body: some View {
        ZStack{
            // 背景画像を指定する
            Image("background")
                // リサイズする
                .resizable()
                // 画像いっぱいになるようにセーフエリア外まで表示されるように指定
                .ignoresSafeArea()
                // アスペクト比（縦横比）を維持して短編基準に収まるようにする
                .aspectRatio(contentMode: .fill)
            
            // 水平にレイアウト（横方向にレイアウト）
            HStack{
                // シンバルボタン
                Button(action: {
                    // ボタンタップ時の処理
                    // シンバルを鳴らす
                    soundPlayer.cymbalPlay()
                }){
                    // 画像を表示する
                    Image("cymbal")
                }// シンバルボタン End
                
                // ギターボタン
                Button(action:{
                    // ボタンタップ時の処理
                    // ギターを鳴らす
                    soundPlayer.guitarPlay()
                }){
                    // 画像を表示する
                    Image("guitar")
                } // ギターボタン End
                
            }
        }// ZStack End
    } // body End
} // ContentView End

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
