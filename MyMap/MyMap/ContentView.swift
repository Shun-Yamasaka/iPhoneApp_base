//
//  ContentView.swift
//  MyMap
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI
import MapKit

struct ContentView: View {
    // 入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    // 検索キーワードを保持する状態変数
    @State var dispSearchKey: String = ""
    // マップ種類の最初は標準から
    @State var dispMapType: MKMapType = .standard
    
    
    var body: some View {
        // 垂直にレイアウト（縦方向にレイアウト）
        VStack{
            // テキストフィールド（文字入力）
            TextField("キーワード", text: $inputText, prompt:Text("キーワードを入力してください"))
                // 入力が完了された時
                .onSubmit{
                    // 入力が完了したので検索キーワードに設定する
                    dispSearchKey = inputText
                }
                // 余白を追加
                .padding()
            ZStack(alignment: .bottomTrailing){
                //　マップを表示
                MapView(serchKey: dispSearchKey, mapType: dispMapType)
                
                // mapTypeプロパティ値をトグル
                // 標準　→ 航空写真 → 航空写真+標準
                // 3D Flyover → 3D Flyover+標準
                // → 交通機関
                // マップ種類切り替えボタン
                Button(action:{
                    if dispMapType == .standard{
                        dispMapType = .satellite
                    } else if dispMapType == .satellite{
                        dispMapType = .hybrid
                    } else if dispMapType == .hybrid{
                        dispMapType = .satelliteFlyover
                    } else if dispMapType == .satelliteFlyover {
                        dispMapType = .hybridFlyover
                    } else if dispMapType == .hybridFlyover {
                        dispMapType = .mutedStandard
                    } else {
                        dispMapType = .standard
                    }
                }){
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0, alignment: .leading)
                }
                
                .padding(.trailing, 20.0)
                .padding(.bottom, 30.0)
            }
            
        } // VStack End
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
