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
        var receivedResponses: [Animal: Int] = [:]
        let answerChose = answersChose.map{ $0.animal }
        
        for answer in answerChose {
            receivedResponses[answer] = (receivedResponses[answer] ?? 0) + 1
        }
        
        let answersSorted = receivedResponses.sorted (by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let popularAnswerDetails = answersSorted.first?.key
        
        currentAnswerLabel.text = "Вы - \(popularAnswerDetails?.rawValue.description ?? "")"
        detailsCurrentAnswersLabel.text = popularAnswerDetails?.definition
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }

    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
