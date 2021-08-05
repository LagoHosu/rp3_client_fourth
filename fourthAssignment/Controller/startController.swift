//
//  ViewController.swift
//  fourthAssignment
//
//  Created by Lago on 2021/07/29.
//

import UIKit

class startController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    let playVC = playingController()
    
    var land:UIImageView!
    var hover:CABasicAnimation!
    var buttonSender = UIButton()
    
    var selectedCharacter = ""
    var selectedSpeed = 0
    var selectedHeart = 0
    var selectedBackground = ""
    
    
    @IBAction func snailSelected(_ sender: UIButton) {
        //looks heavy
        snailButton.setImage( UIImage.init(named: "snail/1"), for: .normal)
        rabbitButton.setImage( UIImage.init(named: "rabbit/0"), for: .normal)
        dogButton.setImage( UIImage.init(named: "dog/0"), for: .normal)


        buttonSender = snailButton
        selectedCharacter = "snail"
        selectedSpeed = 5000
        selectedHeart = 5
        selectedBackground = "background3"
        //selected()
    }
    @IBAction func rabbitSelected(_ sender: UIButton) {
        snailButton.setImage( UIImage.init(named: "snail/0"), for: .normal)
        rabbitButton.setImage( UIImage.init(named: "rabbit/1"), for: .normal)
        dogButton.setImage( UIImage.init(named: "dog/0"), for: .normal)
        
        buttonSender = rabbitButton
        selectedCharacter = "rabbit"
        selectedSpeed = 4000
        selectedHeart = 3
        selectedBackground = "background1"
        //selected()
    }
    @IBAction func dogSelected(_ sender: UIButton) {
        snailButton.setImage( UIImage.init(named: "snail/0"), for: .normal)
        rabbitButton.setImage( UIImage.init(named: "rabbit/0"), for: .normal)
        dogButton.setImage( UIImage.init(named: "dog/1"), for: .normal)
        
        buttonSender = dogButton
        selectedCharacter = "dog"
        selectedSpeed = 1500
        selectedHeart = 2
        selectedBackground = "background4"
        //selected()

    }
    
    
    
    //MARK: - Actions
    
    func moveIt(_ imageView: UIImageView,_ speed:CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: [.curveLinear, .repeat], animations: { //
            imageView.frame.origin.x = self.view.frame.size.width - (imageView.frame.size.width)//1416 - (self.view.frame.size.width)
        }, completion:
            {
                (_) in
                imageView.frame.origin.x = -imageView.frame.size.width + self.view.frame.size.width
            })
    }
    
    
    //datapass to playingVC
    @IBAction func startClicked(_ sender: UIButton) {
        guard let playVC = storyboard?.instantiateViewController(identifier: "playingVC") as? playingController else { return }
        playVC.currentCharacter = selectedCharacter
        playVC.currentSpeed = selectedSpeed
        playVC.currentHeart = selectedHeart
        playVC.currentBackground = selectedBackground
        
        
        self.navigationController?.pushViewController(playVC, animated: true)
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moveIt(background, 10)
        startButton.layer.cornerRadius = 15
        startButton.layer.borderWidth = 1.0
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        moveIt(background, 10)
        
    }
    
    //MARK: - Helper
    
    
    
    
}






