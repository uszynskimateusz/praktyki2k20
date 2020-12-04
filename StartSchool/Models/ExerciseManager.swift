//
//  ExerciseManager.swift
//  StartSchool
//
//  Created by Mateusz Uszyński on 04/12/2020.
//

import Foundation
import Contentful

struct ExerciseManager {
    let client = Client(spaceId: "97yxiwi54acc",
                        environmentId: "master", // Defaults to "master" if omitted
                        accessToken: "cFdpVdx9l10BfIDrdvar_M9I36sJiRVUoXIZoRzKCRg")
    
    func fetchExercise() {
        client.fetchArray(of: Entry.self) { (result: Result<HomogeneousArrayResponse<Entry>, Error>) in
          switch result {
          case .success(let arrayResponse):
            let entries = arrayResponse.items
            for e in entries {
                for f in e.fields {
                    switch f.key {
                    case "title":
                        print(f.value)
                        
                    case "description":
                        print(f.value)
                        
                    case "image":
                        fetchAsset(f.value as! Link)
                        
                    case "answer":
                        print(f.value)
                        
                    case "level":
                        print(f.value)
                        
                    case "done":
                        print(f.value)
                        
                    default:
                        print("something do not good in witch in Exercise Manager fetchExercise")
                    }
                }
                print("-------------------------------------")
            }
          case .failure(let error):
            print(error)
          }
        }
    }
    
    func fetchAsset(_ asset: Contentful.Link) {
        client.fetchImage(for: asset.asset!) { (result: Result<UIImage, Error>) in
          switch result {
          case .success(let image):
            print(image)
          case .failure(let error):
            print(error)
          }
        }
    }
}
