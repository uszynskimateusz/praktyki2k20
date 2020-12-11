//
//  ViewController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 02/12/2020.
//

import UIKit

class SectionController: UIViewController {
    
    @IBOutlet weak var introductionButton: UIButton!
    @IBOutlet weak var imageVC: UIImageView!
    @IBOutlet weak var exerciseButton: UIButton!
    
    var exerciseTab: [ExerciseModel] = []
    
    var exerciseManager = ExerciseManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        exerciseManager.delegate = self
        exerciseManager.fetchExercise()
        
        exerciseButton.isEnabled = false
    }
    
    @IBAction func IntroductionPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func exercisePressed(_ sender: Any) {
        performSegue(withIdentifier: "goToExerciseList", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "goToExerciseList":
                let destinationVC = segue.destination as! ExerciseListController
                destinationVC.exerciseTab = exerciseTab
            default: break
                
            }
        }
    }
}

extension SectionController: ExerciseManagerDelegate {
    func didUpdateExercises(_ exercise: ExerciseModel) {
        exerciseTab.append(exercise)
        exerciseTab = exerciseTab.sorted(by: { $0.title < $1.title })
        DispatchQueue.main.async {
            self.exerciseButton.isEnabled = true
        }
    }
}
