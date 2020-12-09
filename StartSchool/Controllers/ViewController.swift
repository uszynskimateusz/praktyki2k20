//
//  ViewController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 02/12/2020.
//

import UIKit
import Contentful

class ViewController: UIViewController, ExerciseManagerDelegate {
    
    @IBOutlet weak var introductionButton: UIButton!
    @IBOutlet weak var imageVC: UIImageView!
    
    var exerciseTab: [ExerciseModel] = []
    
    var exerciseManager = ExerciseManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exerciseManager.delegate = self
        
        exerciseManager.fetchExercise()
    }
    
    func didUpdateExercises(_ exercies: [ExerciseModel]?) {
        if let exercise = exercies {
            exerciseTab = exercise
            print(exerciseTab.count)
            print("test")
        }
    }
    @IBAction func IntroductionPressed(_ sender: UIButton) {
       // imageVC = UIImageView(image: exerciseTab[0].image)
    }
}

