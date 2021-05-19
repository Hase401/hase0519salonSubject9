//
//  ViewController.swift
//  subject_Re9
//
//  Created by 長谷川孝太 on 2021/05/18.
//

import UIKit

class ViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet private weak var prefectureLabel: UILabel!
    @IBOutlet private weak var selectedPrefectureLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedPrefectureLabel.text = appDelegate.prefectureName
    }
}
