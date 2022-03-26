//
//  ContentView.swift
//  MyFirst
//
//  Created by 山坂駿 on 2022/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var outputText = "Hello, World" // 表示する文字変数
    
    var body: some View {
        VStack{
            Text(outputText)
                .font(.largeTitle)
                .padding()
            Button(action: {
                // ボタンをクリックした際の処理を記述
                outputText = "Hi, Swift!" // 表示文字を変更する
            }) {
                Text("切り替えボタン")
                    .foregroundColor(Color.white)
                    .padding(.all)
                    .background(Color.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // コードでデバイスを追加
//        Group{
//            ContentView()
//                .previewDevice("iPhone 8")
//            ContentView()
//                .previewDevice("iPad Pro (9.7-inch)")
//        }
    }
}
