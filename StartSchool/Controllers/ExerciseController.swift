//
//  ExerciseController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 08/12/2020.
//

import UIKit
import Contentful

class ExerciseController: UIViewController {
    var exerciseManager = ExerciseManager()
    @IBOutlet weak var exerciseTableView: UITableView!
    
    let array: [String] = ["a", "b", "c"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        
        exerciseTableView.register(UINib(nibName: "ExerciseCellTableViewCell", bundle: nil), forCellReuseIdentifier: "exerciseCell")
        
        exerciseManager.fetchExercise()
    }
}

//MARK: - TableView DataSource Methods
extension ExerciseController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath) as! ExerciseCellTableViewCell
        cell.label.text = array[indexPath.row]
        
        return cell
    }
}

extension ExerciseController: UITableViewDelegate {
    
}
