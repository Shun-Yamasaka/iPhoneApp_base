//
//  ContentView.swift
//  MyMap
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 垂直にレイアウト（縦方向にレイアウト）
        VStack{
            // マップを表示
            MapView(serchKey: "東京タワー")
        } // VStack End
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
