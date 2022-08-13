//
//  ViewController.swift
//  catchThanosGame
//
//  Created by Hande Erdal on 13.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    
    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var imageView6: UIImageView!
    
    @IBOutlet weak var imageView7: UIImageView!
    
    @IBOutlet weak var imageView8: UIImageView!
    
    
    @IBOutlet weak var imageView9: UIImageView!
    
    
   
    
    var timer = Timer()
    var hiddentimer = Timer()
    var counter = 10
    var score = 0
    var highscore = 0
    var thanosArray = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thanosGif = UIImage.gifImageWithName("ezgif-4-ec7e303929")
        imageView.image = thanosGif
        imageView2.image = thanosGif
        imageView3.image = thanosGif
        imageView4.image = thanosGif
        imageView5.image = thanosGif
        imageView6.image = thanosGif
        imageView7.image = thanosGif
        imageView8.image = thanosGif
        imageView9.image = thanosGif
        
        
        let storedhighscore = UserDefaults.standard.object(forKey: "highscore")
        
        if(storedhighscore == nil){
            highscore = 0
            highscoreLabel.text = "Highscore : 0"
        }
        if let newScore = storedhighscore as? Int {
            highscore = newScore
            highscoreLabel.text = "Highscore : \(highscore)"
        }
        imageView.isUserInteractionEnabled = true
        imageView2.isUserInteractionEnabled = true
        imageView3.isUserInteractionEnabled = true
        imageView4.isUserInteractionEnabled = true
        imageView5.isUserInteractionEnabled = true
        imageView6.isUserInteractionEnabled = true
        imageView7.isUserInteractionEnabled = true
        imageView8.isUserInteractionEnabled = true
        imageView9.isUserInteractionEnabled = true


        
        let recognizer1 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer2 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer3 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer4 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer5 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer6 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer7 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer8 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        let recognizer9 = UITapGestureRecognizer (target: self, action: #selector(recognizer))
        
        imageView.addGestureRecognizer(recognizer1)
        imageView2.addGestureRecognizer(recognizer2)
        imageView3.addGestureRecognizer(recognizer3)
        imageView4.addGestureRecognizer(recognizer4)
        imageView5.addGestureRecognizer(recognizer5)
        imageView6.addGestureRecognizer(recognizer6)
        imageView7.addGestureRecognizer(recognizer7)
        imageView8.addGestureRecognizer(recognizer8)
        imageView9.addGestureRecognizer(recognizer9)

        thanosArray = [imageView,imageView2,imageView3,imageView4,imageView5,imageView6,imageView7,imageView8,imageView9]
        timeLabel.text = "Time : \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        hiddentimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidethanos), userInfo: nil, repeats: true)
        hidethanos()
        


    }
    
    @objc func hidethanos(){
        for thanos in thanosArray {
            thanos.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(thanosArray.count-1)))
        thanosArray[random].isHidden = false
        
      
        
    }
    
    @objc func recognizer(){
            score += 1
            scoreLabel.text = "Score : \(score)"
    }
    
    
    @objc func timerFunc(){
        timeLabel.text = "Time : \(counter)"
        counter-=1
        if(counter==0)
        {
            timeLabel.text = "Time is over"
            hiddentimer.invalidate()
            imageView.isUserInteractionEnabled = false
            imageView2.isUserInteractionEnabled = false
            imageView3.isUserInteractionEnabled = false
            imageView4.isUserInteractionEnabled = false
            imageView5.isUserInteractionEnabled = false
            imageView6.isUserInteractionEnabled = false
            imageView7.isUserInteractionEnabled = false
            imageView8.isUserInteractionEnabled = false
            imageView9.isUserInteractionEnabled = false


            timer.invalidate()
            if (self.score > self.highscore){
                self.highscore = self.score
                highscoreLabel.text = "Highscore : \(highscore)"
                UserDefaults.standard.setValue(highscore, forKey: "highscore")
                
                
            }
            
                let alert = UIAlertController(title: "Time's up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
                
              
            
            let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: nil)
            let replay = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default){ [self](UIAlertAction) in
                self.imageView.isUserInteractionEnabled = true
                self.imageView2.isUserInteractionEnabled = true
                self.imageView3.isUserInteractionEnabled = true
                self.imageView4.isUserInteractionEnabled = true
                self.imageView5.isUserInteractionEnabled = true
                self.imageView6.isUserInteractionEnabled = true
                imageView7.isUserInteractionEnabled = true
                imageView8.isUserInteractionEnabled = true
                imageView9.isUserInteractionEnabled = true
            
            self.score = 0
            self.timeLabel.text = "Time : \(self.counter)"
            self.counter = 10
            self.scoreLabel.text = "Score : \(self.score)"

            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
            
            self.hiddentimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidethanos), userInfo: nil, repeats: true)
            
                
                
            
            
        }
                alert.addAction(replay)

                alert.addAction(okbutton)
                self.present(alert, animated: true, completion: nil)
    
                
                
            
            if(score > highscore as! Int){
            UserDefaults.standard.set(score, forKey: "highscore")
            }

            highscoreLabel.text = "Highscore : \(highscore)"
        }
       
        
    }

}

