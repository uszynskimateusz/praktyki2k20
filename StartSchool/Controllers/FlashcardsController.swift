//
//  FlashcardsController.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 08/12/2020.
//
import UIKit

class FlashcardsController: UIViewController{
    var exerciseManager = ExerciseManager()
    @IBOutlet weak var flashcardTableView: UITableView!
    
    let array: [String] = ["a", "b", "c"]
    let dArray: [String] = ["aDescription", "bDescription", "cDescription"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        flashcardTableView.dataSource = self
        flashcardTableView.delegate = self

        flashcardTableView.register(UINib(nibName: "FlashcardCell", bundle: nil), forCellReuseIdentifier: "flashcardCell")
        
        exerciseManager.fetchExercise()
    }
}

//MARK: - TableView DataSource Methods
extension FlashcardsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flashcardCell", for: indexPath) as! FlashcardCell
        cell.titleLabel?.text = array[indexPath.row]
        cell.descriptionLabel.text = array[indexPath.row]
        return cell
    }
}

extension FlashcardsController: UITableViewDelegate {
    
}
