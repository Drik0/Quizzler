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
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[indexValue]
        questionLabel.text = firstQuestion.questionText
        updateUI()
        
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
        
        scoreLabel.text = "Score \(score)"
        progressLabel.text = "\(indexValue + 1) / 13"

    }
    

    func nextQuestion() {
        
        if indexValue <= 12 {
        questionLabel.text = allQuestions.list[indexValue].questionText
        updateUI()
            
        } else {
            
            let alert = UIAlertController(title: "Text Complete", message: "Would you like to restart the test?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[indexValue].answer
        if correctAnswer == pickedAnswer {
            score = score + 50
            print("Yay ^^")
        } else {
            print("BOO!!!")
        }
        
        
    }
    
    
    func startOver() {
        
        indexValue = 0
        score = 0
        nextQuestion()
       
    }
    

    
}
