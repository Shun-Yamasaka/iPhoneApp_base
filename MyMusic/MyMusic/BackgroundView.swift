//
//  BackgroundView.swift
//  MyMusic
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI

struct BackgroundView: View {
    // 画像ファイル名
    let imageName: String
    var body: some View {
        // 背景画像を指定する
        Image("background")
            // リサイズする
            .resizable()
            // 画像いっぱいになるようにセーフエリア外まで表示されるように指定
            .ignoresSafeArea()
            // アスペクト比（縦横比）を維持して短編基準に収まるようにする
            .aspectRatio(contentMode: .fill)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(imageName: "backgraund")
    }
}
