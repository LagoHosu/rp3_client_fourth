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
    
    
    //want to make only one character to be selected and change the image when selected
//    func selected() {
//        switch buttonSender {
//        case snailButton:
//            snailButton.isSelected = true
//            rabbitButton.isSelected = false
//            dogButton.isSelected = false
//
//            selectedCharacter = "snail"
//            selectedSpeed = 5
//            selectedHeart = 5
//
//        case rabbitButton:
//            snailButton.isSelected = true
//            rabbitButton.isSelected = false
//            dogButton.isSelected = false
//
//
//
//        case dogButton:
//            dogButton.isSelected = true
//            snailButton.isSelected = false
//            rabbitButton.isSelected = false
//
//        default:
//            print("Error")
//        }
//
//
//        if buttonSender.isSelected == true {
//            buttonSender.imageView?.image = UIImage(named:"\(selectedCharacter).1")
//        } else {
//            buttonSender.imageView?.image = UIImage(named:"\(selectedCharacter).0")
//        }
//    }
    
    
    @IBAction func snailSelected(_ sender: UIButton) {
        snailButton.isSelected = true
        rabbitButton.isSelected = false
        dogButton.isSelected = false

        buttonSender = snailButton
        selectedCharacter = "snail"
        selectedSpeed = 5000
        selectedHeart = 5
        selectedBackground = "background3"
        //selected()
    }
    @IBAction func rabbitSelected(_ sender: UIButton) {
        buttonSender = rabbitButton
        selectedCharacter = "rabbit"
        selectedSpeed = 3000
        selectedHeart = 3
        selectedBackground = "background1"
        //selected()
    }
    @IBAction func dogSelected(_ sender: UIButton) {
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
        
//        want to make the button unable to press if you didn't select character
//        if selectedCharacter == "" {
//            sender.isEnabled = false
//            print("select the character before you start")
//        }

        
        //print("your status is \(selectedCharacter) character, \(selectedSpeed) speed, \(selectedHeart) hearts")
        
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






