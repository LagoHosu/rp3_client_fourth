//
//  playingController.swift
//  fourthAssignment
//
//  Created by Lago on 2021/07/29.
//

import UIKit

class playingController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var coin1: UIImageView!
    @IBOutlet weak var character1: UIImageView!
    
    var barVC = customNavigationBarController()
    var buttonClicked : Int = 0
    
    var backgroundImage = String()
    var character = String()
    
    var currentCharacter = ""
    var currentSpeed = 0
    var currentHeart = 0
    
    
    //MARK: - Actions
    
    //to set the imageView to be animated
    func animatedCoins(for name: String) -> [UIImage] {
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "coin/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    
    //to set the imageView to be animated
    func animatedCharacter(for name: String) -> [UIImage] {
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "\(currentCharacter)/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    
    //make the button related w/result controller
    @IBAction func clicked(_ sender: UIButton) {
        buttonClicked += 1
        print("button No. is \(buttonClicked)")
    }
    
    
    
    //MARK: - Life cycle
    
    
    //MARK: - Helper
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        barVC.navigationItem.hidesBackButton = true

        
        //make the image set move 
        coin1.animationImages = animatedCoins(for: "coin")
        coin1.animationDuration = 0.5
        coin1.animationRepeatCount = 0
        coin1.image = coin1.animationImages?.first
        coin1.startAnimating()
        
        character1.animationImages = animatedCharacter(for: "coin")
        character1.animationDuration = 0.3
        character1.animationRepeatCount = 0
        character1.image = character1.animationImages?.first
        character1.startAnimating()
        
        //buttonClicked = 0
        
        //self.currentCharacter = selectedCharacter
        
        print("and passed information is \(currentCharacter) character, \(currentSpeed) speed, \(currentHeart) hearts")

    }


}
