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
    @IBOutlet weak var gas1: UIImageView!
    @IBOutlet weak var character1: UIImageView!
    @IBOutlet weak var heartLabel: UILabel!
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var jumpButton: UIButton!
    @IBOutlet weak var showResult: UIButton!
    var barVC = customNavigationBarController()
    var buttonClicked : Int = 0
    
    var character = String()
    
    var currentCharacter = ""
    var currentSpeed = 0
    var currentHeart = 0
    var currentBackground = ""
    
    var coinPosition = CGFloat()
    
    let randomTime = Double(arc4random_uniform(4))
    
    var heartStatus = 0
    var coinStatus = 0
    var delayTime = 0.0
    
    
    //MARK: - Actions
    
    
    //to set the imageView to be animated
    func animatedCharacter() -> [UIImage] {
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
    
    @IBAction func jumpClicked(_ sender: UIButton) {
        //make the character jump
        //animation part makes move, and completion part let the object after moved
        UIView.animate(withDuration: 0.6,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction, .autoreverse],
                       animations: {
                        self.character1.center = CGPoint(x: 100 ,y: 645)
                       },completion: { (_) in   //
                        self.character1.center = CGPoint(x: 100 ,y: 710)
                       })
        
        //make the coinStatus plus1 when it jumped and coin is in the area
        let currentCoinLocation = coin1.layer.presentation()!.frame
        if currentCoinLocation.minX < 130 && currentCoinLocation.minX > 50 {
            self.coinStatus += 1
            print("current coinStatus = \(coinStatus)")
            //where should it go,,,
            coin1.alpha = 0
        }
        //let the coinlabel text changed when the coisntatus get plused
        DispatchQueue.main.async {
            // change label text after second calling.
            self.coinLabel.text = "X \(self.coinStatus)"
        }
        
        //make the heart number decreased
        let currentGasLocation = gas1.layer.presentation()!.frame
        if currentGasLocation.minX < 130 && currentGasLocation.minX > 50 && self.character1.layer.presentation()!.frame.midY > 680 { //character.midY = 715, character.midX = 100
            self.heartStatus -= 1
            print("current heartStatus = \(heartStatus)")
//            //where should it go,,,
//            gas1.alpha = 0
        }
        
        DispatchQueue.main.async {
            // change label text after second calling.
            self.heartLabel.text = "X \(self.heartStatus)"
        }
        
        if heartStatus == 0 {
            goResult()
        }
    }
    
    //to set the imageView to be animated
    func changeImageObject(for name: String) -> [UIImage] {
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "\(name)/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
    
    //make the image set move
    func spinObject(objectName: String, sender: UIImageView){
        sender.animationImages = changeImageObject(for: objectName)
        sender.animationDuration = 0.5
        sender.animationRepeatCount = 0
        sender.image = sender.animationImages?.first
        sender.startAnimating()
    }
    
    
    
    func moveCoinObjects(imageView: UIImageView, speed: CGFloat, delayTime: Double) {
        var delay = Double(arc4random_uniform(3))
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        print(delayTime, "is delay time")
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: delay, options: [.repeat, .curveLinear], animations: { //.repeat,
            imageView.frame.origin.x = imageView.frame.size.width - self.view.frame.size.width
            print(imageView.layer.presentation()!.frame, " is \(imageView)'s frame value")
            print(delay, "is random delay time now")
        }, completion:
            { (_) in
                imageView.frame.origin.x = -(imageView.frame.size.width) - self.view.frame.size.width
//                delay = Double(arc4random_uniform(3))
            })
    }
    
    func moveGasObjects(imageView: UIImageView, speed: CGFloat, delayTime: Double) {
        var delay = Double(arc4random_uniform(3))
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        print(delayTime, "is delay time")
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: delay, options: [.repeat, .curveLinear], animations: { //.repeat,
            //frame value = (x value, y value, width, height)
            imageView.frame.origin.x = imageView.frame.size.width - self.view.frame.size.width
            
        }, completion:
            { (_) in
                imageView.frame.origin.x = -(imageView.frame.size.width) - self.view.frame.size.width
                delay = Double(arc4random_uniform(3))
            })
        
    }
    
    
    
    
    //MARK: - Life cycle
    
    
    //MARK: - Helper
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        barVC.navigationItem.hidesBackButton = true
        
        jumpButton.layer.cornerRadius = 15
        
        character1.animationImages = animatedCharacter()
        character1.animationDuration = 0.4
        character1.animationRepeatCount = 0
        character1.image = character1.animationImages?.first
        character1.startAnimating()
        
        background.image = UIImage(named: currentBackground)
        
        heartStatus = currentHeart
        
        heartLabel.text = "X \(heartStatus)"
        coinLabel.text = "X \(coinStatus)"
        
        
        //about object movement
        
        DispatchQueue.main.async {
            usleep(700000)  //dispatchQueue로 대체,
            
            self.moveCoinObjects(imageView: self.coin1, speed: CGFloat(self.currentSpeed), delayTime: self.randomTime)
            self.spinObject(objectName: "coin", sender: self.coin1)
            
        }
        
        //about gas movement
        DispatchQueue.main.async {
            usleep(700000)
            
            self.moveGasObjects(imageView: self.gas1, speed: CGFloat(self.currentSpeed), delayTime: self.randomTime)
            self.spinObject(objectName: "gas", sender: self.gas1)
            
        }
        
        //about heartStatus and get 0
        DispatchQueue.main.async {
            usleep(700001)
            
            //make the heartStatus minus1 when it touched
            print("current coinStatus = \(self.coinStatus)")
            
        }
        
        
    }
    
    //want to make
    override func viewWillAppear(_ animated: Bool) {
        heartStatus = currentHeart
        coinStatus = 0
    }
    
    
    
    @objc func goResult(){
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! resultController
        alert.modalPresentationStyle = .overCurrentContext
        alert.getScore = coinStatus
        alert.backgroundImage = currentBackground
        present(alert, animated: false, completion: nil)
    }
    
    
}


/* what should do is,,,
     1. make the coin/gas disappear when the value changed
     2. change the delay time in animation method every turn
 */
