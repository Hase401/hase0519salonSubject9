//
//  ViewController.swift
//  subject_Another9
//
//  Created by 長谷川孝太 on 2021/05/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var prefectureLabel: UILabel!

    @IBAction func updateLabel(segue:UIStoryboardSegue){
        let secondVC = segue.source as! SecondViewController
        self.prefectureLabel.text = secondVC.selectedPrefecture
    }
    
    @IBAction func exitCancel(segue:UIStoryboardSegue){}
}

