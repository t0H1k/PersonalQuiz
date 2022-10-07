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
    
    private func calculateResult() {
        var userResponses: [Animal: Int] = [:]
        let answerChose = answersChose.map{ $0.animal }
        
        for answer in answerChose {
            userResponses[answer] = (userResponses[answer] ?? 0) + 1
        }
        
        let answersSorted = userResponses.sorted {
            (pairOne, pairTwo) -> Bool in
            return pairOne.value > pairTwo.value
        }
        
        let finalAnswer = answersSorted.first?.key
        
        currentAnswerLabel.text = "Вы - \(finalAnswer?.rawValue.description ?? "")"
        detailsCurrentAnswersLabel.text = finalAnswer?.definition
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
