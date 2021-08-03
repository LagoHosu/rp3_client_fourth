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
    
    @IBOutlet weak var showResult: UIButton!
    var barVC = customNavigationBarController()
    var buttonClicked : Int = 0
    
    var character = String()
    
    var currentCharacter = ""
    var currentSpeed = 0
    var currentHeart = 0
    var currentBackground = ""
    
    var coinPosition = CGFloat()
    
    let randomTime = Int(arc4random_uniform(4))

    var heartStatus = 0
    var coinStatus = 0
    
    
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
        UIView.animate(withDuration: 0.4,
                       delay: 0.0,
                       options: [.curveEaseInOut , .allowUserInteraction, .autoreverse],
                       animations: {
                        self.character1.center = CGPoint(x: 100 ,y: 645)
                       },completion: { (_) in   //
                        self.character1.center = CGPoint(x: 100 ,y: 710)
                       })
        
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

    
    
    func moveObjects(_ imageView: UIImageView, _ speed: CGFloat) {
        let speeds = speed
        let imageSpeed = speeds / view.frame.size.width
        let averageSpeed = (view.frame.size.width - imageView.frame.origin.x) * imageSpeed
        UIView.animate(withDuration: TimeInterval(averageSpeed), delay: 0.0, options: .curveLinear, animations: {
            self.coinPosition = imageView.frame.origin.x
            imageView.frame.origin.x = imageView.frame.size.width - self.view.frame.size.width
        }, completion:
            { (_) in
                imageView.frame.origin.x = -(imageView.frame.size.width) + self.view.frame.size.width
            //self.moveObjects2(imageView,speeds)
        })
    }
    
    
    
    
    //MARK: - Life cycle
    
    
    //MARK: - Helper
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        barVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        barVC.navigationItem.hidesBackButton = true
        
        
        character1.animationImages = animatedCharacter()
        character1.animationDuration = 0.3
        character1.animationRepeatCount = 0
        character1.image = character1.animationImages?.first
        character1.startAnimating()
        
        background.image = UIImage(named: currentBackground)
      
        heartStatus = currentHeart
        
        heartLabel.text = "X \(heartStatus)"
        coinLabel.text = "X \(coinStatus)"
        
        
        //about coin movement
        
        //while절 안에 DispatchQueue 둘다 넣어버리고 랜덤으로 돌리자
        //조건문 두개 만들어서 코인, 가스-하트 숫자 조정하기
        //반복할거면 DispatchQueue를 안에 넣어야하는건가, 조건문이나 반복문 돌려봐야겠네
        DispatchQueue.main.async {
            usleep(1500000)
            
            self.moveObjects(self.coin1, CGFloat(self.currentSpeed))
            print("position1 is \(self.coinPosition)")

            self.spinObject(objectName: "coin", sender: self.coin1)
            usleep(useconds_t(self.randomTime))
            //print(useconds_t(self.randomTime))

            


        }
        
        //about gas movement
        DispatchQueue.main.async {
            usleep(1500000)
            
            self.moveObjects(self.gas1, CGFloat(self.currentSpeed))

            self.spinObject(objectName: "gas", sender: self.gas1)
            //print(useconds_t(self.randomTime))
            //usleep(useconds_t(randomTime))

        }
                
        //let the result view appear
        showResult.addTarget(self, action: #selector(goResult), for: .touchUpInside)
        
        
    }
    @objc func goResult(){
        let alert = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as! resultController
        alert.modalPresentationStyle = .overCurrentContext
        present(alert, animated: false, completion: nil)
    }
    
    
}
