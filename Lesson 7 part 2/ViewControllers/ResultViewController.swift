//
//  ResultViewController.swift
//  Lesson 7 part 2
//
//  Created by Владислав Клунный on 18.08.2023.
//

import UIKit

class ResultViewController: UIViewController {

        @IBOutlet var animalLabel: UILabel!
        @IBOutlet var descriptionLabel: UILabel!
    
        var answers: [Answer] = []
    
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.hidesBackButton = true
         updateResult()
        }
        
        @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
            navigationController?.dismiss(animated: true)
            
    //        view.window?.rootViewController?.dismiss(animated: true)
            
        }
    //    deinit {
    //        print("\(type(of: self)) hasn been deallocated")
    //    }
        
    }

    // MARK: - Private Methods
    extension ResultViewController {
        private func updateResult() {
            var frequencyOfAnimals: [Animal: Int] = [:]
            let animals = answers.map { $0.animal }
            
            for animal in animals {
                if let animalTypeCount = frequencyOfAnimals[animal] {
                    frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
                } else {
                    frequencyOfAnimals[animal] = 1
                }
            }
            
            let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
            guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
            
            updateUI(animal: mostFrequencyAnimal)
        }
        
        private func updateUI (animal: Animal) {
            animalLabel.text = "Вы \(animal.rawValue)!"
            descriptionLabel.text = animal.difinition
            
        }
    }

// Пришлось поглядывть причем не мало
// Был небольшой перерыв, подзабыл, думаю теперь нужно пройтись по предыдущим урокам
