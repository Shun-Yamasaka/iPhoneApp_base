//
//  MapView.swift
//  MyMap
//
//  Created by 山坂駿 on 2022/03/27.
//

import SwiftUI
import MapKit

// UIViewRepresentableプロトコルを使用する場合には
// makeUIViewメソッドとupdateUIViewメソッドの記述が必要になる
struct MapView: UIViewRepresentable {
    // 検索キーワード
    let serchKey: String
    // マップ種類
    let mapType:MKMapType
    
    // 表示するViewを作成する時に実行
    // 画面に表示する前に一度だけ実行され、表示に必要なViewを作成する
    func makeUIView(context: Context) -> MKMapView{
        // MKMapViewのインスタンス生成
        MKMapView()
    } // makeUIView End
    
    // 表示したViewが更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context){
        // 入力された文字をデバックエリアに表示
        print(serchKey)
        
        // マップの種類の設定
        uiView.mapType = mapType
        
        // CLGeocoderインスタンスを取得
        let geocoder = CLGeocoder()
        
        // 入力された文字から位置情報を取得
        geocoder.geocodeAddressString(
            serchKey,
            completionHandler: {(placemarks,error) in
                // リクエストの結果が存在し、1件目の情報から位置情報を取り出す
                if let unwrapPlacemarks = placemarks,
                   let firestPlacemark = unwrapPlacemarks.first,
                   let location = firestPlacemark.location{
                    
                    // 位置情報から緯度経度をtargetCoordinateに取り出す
                    let targetCoordinate = location.coordinate
                    
                    // 緯度経度をデバックエリアに表示
                    print(targetCoordinate)
                    
                    // MKPointAnnotationインスタンスを取得し、ピンを生成
                    let pin = MKPointAnnotation()
                    
                    // ピンを置く場所に緯度経度を設定
                    pin.coordinate = targetCoordinate
                    
                    // ピンのタイトルを設定
                    pin.title = serchKey
                    
                    // ピンを地図に置く
                    uiView.addAnnotation(pin)
                    
                    // 緯度経度を中心にして半径500mの範囲を表示
                    uiView.region = MKCoordinateRegion(
                        center: targetCoordinate,
                        latitudinalMeters: 500.0,
                        longitudinalMeters: 500.0)
                } // if End
            }
        ) // geocoder End
    } // updateUIView End
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(serchKey: "東京タワー", mapType: .standard)
    }
}
