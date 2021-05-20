//
//  ViewController.swift
//  subject_Re9
//
//  Created by 長谷川孝太 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var selectedPrefectureLabel: UILabel!
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        let prefecturePicker = ModalViewController.instantiate(
            didSelectPrefecture: { [weak self] name in
                self?.selectedPrefectureLabel.text = name
            }
        )

        let navigationController = UINavigationController(
            rootViewController: prefecturePicker
        )

        present(navigationController, animated: true)
    }
}
