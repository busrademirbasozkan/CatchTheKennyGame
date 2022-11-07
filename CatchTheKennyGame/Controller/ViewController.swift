//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Büşra Özkan on 7.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //Views
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    //Variables
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "SCORE: \(score)"
        
        //GestureRecognizer ile resimleri tıklanabilir formata getirme.
        kenny1.isUserInteractionEnabled = true
        kenny2.isUserInteractionEnabled = true
        kenny3.isUserInteractionEnabled = true
        kenny4.isUserInteractionEnabled = true
        kenny5.isUserInteractionEnabled = true
        kenny6.isUserInteractionEnabled = true
        kenny7.isUserInteractionEnabled = true
        kenny8.isUserInteractionEnabled = true
        kenny9.isUserInteractionEnabled = true
        
        let gesture1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let gesture9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kenny1.addGestureRecognizer(gesture1)
        kenny2.addGestureRecognizer(gesture2)
        kenny3.addGestureRecognizer(gesture3)
        kenny4.addGestureRecognizer(gesture4)
        kenny5.addGestureRecognizer(gesture5)
        kenny6.addGestureRecognizer(gesture6)
        kenny7.addGestureRecognizer(gesture7)
        kenny8.addGestureRecognizer(gesture8)
        kenny9.addGestureRecognizer(gesture9)
        
        kennyArray = [kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        
        //Timer
        counter = 10
        timeLabel.text = "Time: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        
        hideKenny()
        }
    
    
    @objc func hideKenny(){
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        
        //Rastgele bir Kenny'nin görünmesi için kullanılan hazır fonksiyon
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    

    
    
    @objc func increaseScore(){
        score = score + 1
        scoreLabel.text = "SCORE: \(score)"
    }
    
    @objc func timerFunc(){
        counter = counter - 1
        timeLabel.text = "Time: \(counter)"
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            //Alert
            let alert = UIAlertController(title: "Time's Up", message: "do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default){
                (UIAlertAction) in      }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
        }
    }
}
