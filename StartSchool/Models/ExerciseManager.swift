//
//  ExerciseManager.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 06/12/2020.
//

import UIKit

protocol ExerciseManagerDelegate {
    func didUpdateExercises(_ exercise: [ExerciseModel])
}

struct ExerciseManager {
    let exerciseURL =  "https://cdn.contentful.com/spaces/97yxiwi54acc/environments/master/entries?access_token=cFdpVdx9l10BfIDrdvar_M9I36sJiRVUoXIZoRzKCRg"
    
    var delegate: ExerciseManagerDelegate?
    
    //MARK: - Fetch Exercise Model
    func fetchExercise() {
        if let url = URL(string: exerciseURL) { //entries URL
            let session = URLSession(configuration: .default) //url session create
            
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(exerciseData: safeData)
                }
            }
            
            task.resume() //start task
        }
    }
    
    func parseJSON(exerciseData: Data) {
        let decoder = JSONDecoder()
        var exerciseTab: [ExerciseModel] = []
        do {
            let decodedData = try decoder.decode(ExerciseData.self, from: exerciseData)
            for d in decodedData.items {
                for i in decodedData.includes.Asset {
                    if d.fields.image.sys.id == i.sys.id {
                        if let urlImage = URL(string: "https:\(i.fields.file.url)") {
                            if let uiImage = UIImage(url: urlImage) {
                                let exercise = ExerciseModel(title: d.fields.title, description: d.fields.description, answer: d.fields.answer, level: d.fields.level, done: d.fields.done, image: uiImage)
                                exerciseTab.append(exercise)
                            }
                        }
                    }
                }
            }
        } catch {
            print("erros there \(error.localizedDescription)")
        }
        self.delegate?.didUpdateExercises(exerciseTab)
    }
}

//MARK: - UIImage Extension
extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        do {
            self.init(data: try Data(contentsOf: url))
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
