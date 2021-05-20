//
//  SecondViewController.swift
//  subject_Another9
//
//  Created by 長谷川孝太 on 2021/05/20.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {

    // private と private(set) の違いは？？？
    private(set) var selectedPrefecture: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Prefecture.allCases.enumerated())

        // UIボタンを作成（viewDidLoad内の1回だけの予呼び出し時）
        Prefecture.allCases
            .enumerated()
            .map { offset, prefecture in
                let button = UIButton()
                button.setTitle(prefecture.name, for: .normal)
                button.setTitleColor(.blue, for: .normal)

                // 複数スクリーンサイズ対応のことを考えると固定座標でのレイアウトはバッドノウハウ
                // Auto Layoutを使うべき
                button.frame.size = CGSize(width:70, height:40)
                button.center.x = view.frame.width / 2
                button.center.y = view.safeAreaInsets.top + (CGFloat(offset) * button.frame.height + 150)

                let action: Selector
                switch prefecture {
                    case .chiba:
                        action = #selector(tappedChiba(_:))
                    case .kanagawa:
                        action = #selector(tappedKanagawa(_:))
                    case .tokyo:
                        action = #selector(tappedTokyo(_:))
                    case .saitama:
                        action = #selector(tappedSaitama(_:))
                }

                button.addTarget(self, action: action, for: .touchUpInside)

                return button
            }
            .forEach {
                view.addSubview($0)
            }
    }
    
    @objc private func tappedChiba(_ sender:UIButton){
        tappedPrefecture(prefecture: .chiba)
    }
    @objc private func tappedKanagawa(_ sender:UIButton){
        tappedPrefecture(prefecture: .kanagawa)
    }
    @objc private func tappedTokyo(_ sender:UIButton){
        tappedPrefecture(prefecture: .tokyo)
    }
    @objc private func tappedSaitama(_ sender:UIButton){
        tappedPrefecture(prefecture: .saitama)
    }

    
    // 何回も使うボタンタップ時のイベント関数を定義
    private func tappedPrefecture(prefecture: Prefecture) {
        selectedPrefecture = prefecture.name
        performSegue(withIdentifier: "updateLabel",sender: nil)
    }
}

//enum Prefecture:String, CaseIterable{
enum Prefecture: CaseIterable {
//     ローカライズ考慮のことを考えると良い方法ではない
//    case hokkaido = "北海道"
//    case kanagawa = "神奈川"
//    case tokyo = "東京"
//    case saitama = "埼玉"

    case chiba
    case kanagawa
    case tokyo
    case saitama

    // 追加
    var name: String {
        switch self {
            case .chiba: return "千葉県"
            case .kanagawa: return "神奈川県"
            case .tokyo: return "東京都"
            case .saitama: return "埼玉県"
        }
    }
}
