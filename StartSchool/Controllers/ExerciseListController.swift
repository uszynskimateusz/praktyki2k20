//
//  ExerciseController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 08/12/2020.
//


import UIKit

class ExerciseListController: UIViewController {
    var exerciseManager = ExerciseManager()
    
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var exerciseTableView: UITableView!
    
    var exerciseTab: [ExerciseModel] = []
    var selectedExercise: ExerciseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exerciseManager.fetchExercise()
        
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        exerciseTableView.register(UINib(nibName: "ExerciseCellTableViewCell", bundle: nil), forCellReuseIdentifier: "exerciseCell")
    }
}

//MARK: - TableView DataSource Methods
extension ExerciseListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exerciseTab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCellTableViewCell
        cell.label.text = exerciseTab[indexPath.row].title
        cell.selectionStyle = .none
        
        return cell
    }
}

//MARK: - TableView Delegate Methods
extension ExerciseListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToExercise", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SingleExerciseController

        if let indexPath = exerciseTableView.indexPathForSelectedRow {
            destinationVC.selectedExercise = exerciseTab[indexPath.row]
        }
    }
}
