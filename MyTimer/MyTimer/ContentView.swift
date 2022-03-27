//
//  ContentView.swift
//  MyTimer
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI

struct ContentView: View {
    // タイマーの変数を作成
    @State var timerHandler : Timer?
    // カウント（経過時間）の変数を作成
    @State var count = 0
    // 永続化する秒数設定（初期値は10）
    @AppStorage("timer_value") var timerValue = 10
    
    var body: some View {
        NavigationView{
            // 奥から手前方向にレイアウト
            ZStack{
                // 背景画像
                Image("backgroundTimer")
                    // リサイズする
                    .resizable()
                    // セーフエリアを超えて画面全体に配置する
                    .ignoresSafeArea()
                    // アスペクト比（縦横比）を維持して短辺基準に収まるようにする
                    .aspectRatio(contentMode: .fill)
                // 垂直にレイアウト（縦方向にレイアウト）
                // View（部品）間の間隔を30にする
                VStack(spacing: 30.0){
                    // テキストを表示する（残り時間）
                    Text("残り\(timerValue-count)秒")
                        // 文字サイズを指定
                        .font(.largeTitle)
                    // 水平にレイアウト（横方向にレイアウト）
                    HStack{
                        // スタートボタン
                        Button(action:{
                            // スタートボタン押下時のアクション
                            startTimer()
                        }){
                            // テキストを表示
                            Text("スタート")
                                // 文字サイズを指定
                                .font(.title)
                                // 文字色を白に指定
                                .foregroundColor(Color.white)
                                // 幅高さを140に指定
                                .frame(width:140, height: 140)
                                // 背景を設定
                                .background(Color("startColor"))
                                // 円形に切り抜く
                                .clipShape(Circle())
                        }// スタートボタン End
                        // ストップボタン
                        Button(action:{
                            // ストップボタン押下時のアクション
                            if let unwrapedTimerHandler = timerHandler{
                                // もしタイマーが実行中だったら停止
                                if unwrapedTimerHandler.isValid == true{
                                    // タイマー停止
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                            
                        }){
                            // テキストを表示
                            Text("ストップ")
                                // 文字サイズを指定
                                .font(.title)
                                // 文字色を白に指定
                                .foregroundColor(Color.white)
                                // 幅高さを140に指定
                                .frame(width:140, height: 140)
                                // 背景を設定
                                .background(Color("stopColor"))
                                // 円形に切り抜く
                                .clipShape(Circle())
                        }// ストップボタン End
                    }// HStack End
                } // VSTack End
            } // ZStack End
            
            // 画面が表示される時に実行される
            .onAppear{
                // カウント（経過時間）の変数を初期化
                count = 0
            } // onAppear End
            
            // ナビゲーションにボタン追加
            .toolbar{
                // ナビゲーションバーの左にボタンを追加
                ToolbarItem(placement: .navigationBarTrailing){
                    // ナビゲーション遷移
                    NavigationLink(destination: SettingView()){
                        // テキストを表示
                        Text("秒数設定")
                    }// NavigationLink End
                }// ToolbarItem End
            }// .toolbar End
        }// NavigationView End
        // ipadへ対応
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    // 1秒毎に実行されてカウントダウンする
    func countDownTimer(){
        // count(経過時間)に+1指定く
        count += 1
        
        // 残り時間が0以下の時、タイマーを止める
        if timerValue - count <= 0 {
            // タイマー停止
            timerHandler?.invalidate()
        }
    }// countDownTimer() End
    
    // タイマーをカウントダウン開始する関数
    func startTimer(){
        // timerHandlerをアンラップしてunwrapedTimerHandlerに代入
        if let unwrapedTimerHandler = timerHandler{
            // もしタイマーが実行中だったらスタートしない
            if unwrapedTimerHandler.isValid == true{
                // 何もしない
                return
            }
        }
        
        // 残り時間が0以下の時、count（経過時間）を0に初期化する
        if timerValue - count <= 0 {
            // cuont(経過時間)を0に初期化する
            count = 0
        }
        
        // タイマーをスタート
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            // タイマー実行時に呼び出される
            // 1秒毎に実行されてカウントダウンする関数を実行する
            countDownTimer()
        }
    } // startTimer End
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
