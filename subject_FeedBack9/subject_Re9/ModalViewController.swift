//
//  ModalViewController.swift
//  subject_Re9
//
//  Created by 長谷川孝太 on 2021/05/19.
//

import UIKit

class ModalViewController: UIViewController {
    private enum Kantou {
        static let tokyo = "東京都"
        static let kanagawa = "神奈川県"
        static let saitama = "埼玉県"
        static let chiba = "千葉県"
    }
    
    static func instantiate(didSelectPrefecture: @escaping (String) -> Void) -> ModalViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "ModalViewController")
            as! ModalViewController
        viewController.didSelectPrefectureHandler = didSelectPrefecture
        return viewController
    }

    private var didSelectPrefectureHandler: (String) -> Void = { _ in }
    
    // 遊び
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(didSelectPrefectureHandler)
//    }
    
    @IBAction private func selectTokyoButton(_ sender: UIButton) {
        selectPrefecture(Kantou.tokyo)
    }
    @IBAction private func selectKanagawaButton(_ sender: UIButton) {
        selectPrefecture(Kantou.kanagawa)
    }
    @IBAction private func selectSaitamaButton(_ sender: UIButton) {
        selectPrefecture(Kantou.saitama)
    }
    @IBAction private func selectChibaButton(_ sender: UIButton) {
        selectPrefecture(Kantou.chiba)
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func selectPrefecture(_ name: String) {
        didSelectPrefectureHandler(name)
        dismiss(animated: true, completion: nil)
    }
}
