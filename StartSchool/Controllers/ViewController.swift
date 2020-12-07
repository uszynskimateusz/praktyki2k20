//
//  ViewController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 02/12/2020.
//

import UIKit
import Contentful

class ViewController: UIViewController {
    @IBOutlet weak var introductionButton: UIButton!
    @IBOutlet weak var imageVC: UIImageView!
    
    var exerciseManager = ExerciseManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        exerciseManager.fetchExercise()
    }
}

