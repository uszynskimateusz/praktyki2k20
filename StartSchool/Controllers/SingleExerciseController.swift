//
//  SingleExerciseController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 10/12/2020.
//

import UIKit

class SingleExerciseController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var showARButton: UIButton!
    @IBOutlet weak var showAnswerButton: UIButton!
    
    var selectedExercise: ExerciseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        titleLabel.text = selectedExercise?.title
        descriptionLabel.text = selectedExercise?.description
        imageImageView.image = selectedExercise?.image
    }
    
    @IBAction func showAnswerPressed(_ sender: UIButton) {
    }
}
    
