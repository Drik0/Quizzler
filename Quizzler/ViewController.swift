//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer = true
    var indexValue = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[indexValue]
        questionLabel.text = firstQuestion.questionText
        
    }
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        indexValue = indexValue + 1
        nextQuestion()
        print(indexValue)
        
        }
        
  
    
    
    func updateUI() {

    }
    

    func nextQuestion() {
        
        
        if indexValue <= 12 {
        questionLabel.text = allQuestions.list[indexValue].questionText
        } else {
            print("End of test.")
            indexValue = 0
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[indexValue].answer
        if correctAnswer == pickedAnswer {
            print("Yay ^^")
        } else {
            print("BOO!!!")
        }
        
        
    }
    
    
    func startOver() {
        
        
       
    }
    

    
}
