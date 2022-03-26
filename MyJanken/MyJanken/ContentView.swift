//
//  ContentView.swift
//  MyJanken
//
//  Created by 山坂駿 on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0 // じゃんけんの数字を入れる変数
    
    var body: some View {
        
        // 垂直にレイアウト（縦方向にレイアウト）
        VStack {
            // スペースを追加
            Spacer()
            
            // じゃんけんの数字が0だったら
            if answerNumber == 0 {
                // 初期画面のテキストを表示
                Text("これからじゃんけんをします")
                // 下辺に余白を設定
                .padding(.bottom)
            } else if answerNumber == 1 {
                // じゃんけんの数字が1だったら、グー画像を指定
                // Imageで画像指定（グー画像）
                Image("gu")
                    // モディファイアは改行して縦に積み上げていくのが一般的
                    // .で繋げて記述することをChain(チェーン)という
                    // リサイズ指定
                    .resizable()
                    // 画像内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("グー")
                // 下辺に余白を設定
                .padding(.bottom)
            } else if answerNumber == 2 {
                // じゃんけんの数字が2だったら、チョキ画像を指定
                // Imageで画像指定（チョキ画像）
                Image("choki")
                    // リサイズ指定
                    .resizable()
                    // 画像内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("チョキ")
                // 下辺に余白を設定
                .padding(.bottom)
            } else {
                // じゃんけんの数字が「1」と「2」以外だったら、パー画像を指定
                // Imageで画像指定（パー画像）
                Image("pa")
                    // リサイズ指定
                    .resizable()
                    // 画像内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                // じゃんけんの種類を指定
                Text("パー")
                // 下辺に余白を設定
                .padding(.bottom)
            }
            
            // [じゃんけんをする！]ボタン start
            Button(action:{
                // ボタン処理
                //print("タップされたよ！") // デバック用
                // 次のじゃんけんへ（乱数で1〜3を発生させる）
                //answerNumber = Int.random(in: 1...3)
                
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                repeat{
                    // 1, 2, 3の変数をランダムに算出（乱数）
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 前回と同じ結果の時は、再度ランダムに数値を出す
                    // 異なる結果の時は、repeatを抜ける
                }while answerNumber == newAnswerNumber
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
                
            }){
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity) // Textを画面いっぱいに表示
                    .frame(height: 100) // Textの高さを100pxに指定
                    .font(.title) // iOSが提供する組込みのフォントサイズ
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }// [じゃんけんをする！]ボタン end
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
