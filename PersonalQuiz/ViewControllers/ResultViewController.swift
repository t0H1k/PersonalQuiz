//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Anton Boev on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var currentAnswerLabel: UILabel!
    @IBOutlet var detailsCurrentAnswersLabel: UILabel!
    
    var answersChose: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
// MARK: - Private Methods
extension ResultViewController {
    private func calculateResult() {
        var userResponses: [Animal: Int] = [:]
        let answerChose = answersChose.map{ $0.animal }
        
        /*
         Implementation variant of the method №1
         
         for animal in animals {
         if let animalTypeCount = frequencyOfAnimals[animal] {
         frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
         } else {
         frequencyOfAnimals[animal] = 1
         }
         }
         */
        
        /*
         Implementation variant of the method №2
         
         for answer in answerChose {
         userResponses[answer] = (userResponses[answer] ?? 0) + 1
         }
         */
        
        // the most understandable way to implement the method
        for answer in answerChose {
            userResponses[answer, default: 0] += 1
        }
        
        let answersSorted = userResponses.sorted { $0.value > $1.value }
        guard let finalAnswer = answersSorted.first?.key else { return }
        
        /*
         implementation of the method in one line
         let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal }
         .sorted { $0.value.count > $1.value.count }
         .first?.key
         */
        
        updateUI(with: finalAnswer)
    }
    
    private func updateUI(with finalAnswer: Animal) {
        currentAnswerLabel.text = "Вы - \(finalAnswer.rawValue)!"
        detailsCurrentAnswersLabel.text = finalAnswer.definition
    }
}
