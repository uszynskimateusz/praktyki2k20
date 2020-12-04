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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Retain the client as a property on a type you define so that
        // the client's asynchronous network callbacks are executed.
        let exerciseManager = ExerciseManager()
        //exerciseManager.fetchExercise()
        exerciseManager.fetchExercise()
        
        
//        exerciseManager.fetchAsset()
    }
}

