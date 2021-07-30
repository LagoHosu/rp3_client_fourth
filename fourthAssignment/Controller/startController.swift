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
    let playVC = playingController()
    
    var land:UIImageView!
    var hover:CABasicAnimation!
    
    var selectedCharacter = ""
    var selectedSpeed = 0
    var selectedHeart = 0
    
    @IBAction func snailSelected(_ sender: UIButton) {
        selectedCharacter = "snail"
        selectedSpeed = 5
        selectedHeart = 5
    }
    @IBAction func rabbitSelected(_ sender: UIButton) {
        selectedCharacter = "rabbit"
        selectedSpeed = 10
        selectedHeart = 3
    }
    @IBAction func dogSelected(_ sender: UIButton) {
        selectedCharacter = "dog"
        selectedSpeed = 15
        selectedHeart = 2
        
    }
    
    
    
    //MARK: - Actions
    
    
    //datapass to playingVC
    @IBAction func startClicked(_ sender: UIButton) {
        guard let playVC = storyboard?.instantiateViewController(identifier: "playingVC") as? playingController else { return }
        playVC.currentCharacter = selectedCharacter
        playVC.currentSpeed = selectedSpeed
        playVC.currentHeart = selectedHeart
        
        //print("your status is \(selectedCharacter) character, \(selectedSpeed) speed, \(selectedHeart) hearts")
        
        self.navigationController?.pushViewController(playVC, animated: true)
    }
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make the background move from RtoL
        land = background //UIImageView(image: UIImage(named: "background"))
        //land.frame = CGRect(x: 0, y: 0, width: 375.0, height: 666.0)
        
        UIView.animate(withDuration: 40, delay: 0, options: [.repeat, .curveLinear], animations: { //, .autoreverse
            self.land.frame.origin.x = self.view.bounds.width - self.land.frame.width + 400
            //이어지게 하고싶은데 어떻게 해야되는거지,,
            //back 누르면 안움직이는데,,?
        }, completion: nil)
        self.view.insertSubview(land, aboveSubview: background)
    }
    
    //MARK: - Helper
    
    
    
    
}






