//
//  ExerciseManager.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 06/12/2020.
//

import UIKit

struct ExerciseManager {
    let exerciseURL = "https://cdn.contentful.com/spaces/97yxiwi54acc/environments/master/entries?access_token=cFdpVdx9l10BfIDrdvar_M9I36sJiRVUoXIZoRzKCRg"
    
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
    
    func fetchImage(id: String, completionHandler: @escaping (UIImage) -> Void) {
        let urlString = "https://cdn.contentful.com/spaces/97yxiwi54acc/environments/master/assets/\(id)?access_token=cFdpVdx9l10BfIDrdvar_M9I36sJiRVUoXIZoRzKCRg"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default) //url session create
            
            //give session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(ImageData.self, from: safeData)
                        
                        if let urlImage = URL(string: "https:\(decodedData.fields.file.url)") {
                            if let uiImage = UIImage(url: urlImage) {
                                completionHandler(uiImage)
                            }
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            
            task.resume() //start task
        }
    }
    
    func parseJSON(exerciseData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ExerciseData.self, from: exerciseData)
            for d in decodedData.items {
                fetchImage(id: d.fields.image.sys.id) { image in
                    let exercise = ExerciseModel(title: d.fields.title, description: d.fields.description, answer: d.fields.answer, level: d.fields.level, done: d.fields.done, image: image)
                    
                    exercise.printAll()
                }
            }
        } catch {
            print(error.localizedDescription)
        }
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
