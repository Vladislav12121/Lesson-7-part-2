//
//  QuestionViewController.swift
//  Lesson 7 part 2
//
//  Created by Владислав Клунный on 05.08.2023.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedStackView: UIStackView!
    
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var singleStackView: UIStackView!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let question = Question.getQuestions()
    private var answersChosen: [Answer] = []
    private var questionIndex = 0
    private var answers: [Answer] {
        question[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
 
    }
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: Any) {
    }
    
    @IBAction func multipleAnswerButtonPressed() {
    }
    
    @IBAction func rangedAnswerButtonPressed() {
    }
    
}

//MARK: - Private Methods
extension QuestionViewController {
    private func updateUI() {
        // Hide everything
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden.toggle()
        }
        
        // Get current question
        let currentQuestion = question[questionIndex]
        
        // Set current question for question label
        questionLabel.text = currentQuestion.title
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(question.count)
        
        //Set progress for question progressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос№ \(questionIndex + 1) из \(question.count)"
        
    
        showCurrentAnswers(for: currentQuestion.responseType)
            
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: answers)
        case .multiple: break
        case .ranged: break
        }
    }
        private func showSingleStackView(with answers: [Answer]) {
            singleStackView.isHidden.toggle()
            
            for (button, answer) in zip(singleButtons, answers) {
                button.setTitle(answer.title, for: .normal)
            }
        }
}
