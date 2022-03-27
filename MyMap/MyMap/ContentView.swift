//
//  ContentView.swift
//  MyMap
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI

struct ContentView: View {
    // 入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    // 検索キーワードを保持する状態変数
    @State var dispSearchKey: String = ""
    
    
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
            
            // マップを表示
            MapView(serchKey: dispSearchKey)
        } // VStack End
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
