//
//  ModalViewController.swift
//  subject_Re9
//
//  Created by 長谷川孝太 on 2021/05/19.
//

import UIKit

class ModalViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private enum Kantou {
        static let tokyo = "東京都"
        static let kanagawa = "神奈川県"
        static let saitama = "埼玉県"
        static let chiba = "千葉県"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presentingViewController?.beginAppearanceTransition(false, animated: animated)
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentingViewController?.endAppearanceTransition()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentingViewController?.beginAppearanceTransition(true, animated: animated)
        presentingViewController?.endAppearanceTransition()
    }
    
    @IBAction private func showModalButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction private func selectTokyoButton(_ sender: UIButton) {
        selectPerfecture(Kantou.tokyo)
    }
    @IBAction private func selectKanagawaButton(_ sender: UIButton) {
        selectPerfecture(Kantou.kanagawa)
    }
    @IBAction private func selectSaitamaButton(_ sender: UIButton) {
        selectPerfecture(Kantou.saitama)
    }
    @IBAction private func selectChibaButton(_ sender: UIButton) {
        selectPerfecture(Kantou.chiba)
    }
    
    private func selectPerfecture(_ name: String) {
        appDelegate.prefectureName = String(name)
        dismiss(animated: true, completion: nil)
    }
}
