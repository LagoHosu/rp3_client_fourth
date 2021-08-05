//
//  resultController.swift
//  fourthAssignment
//
//  Created by Lago on 2021/07/29.
//

import UIKit

class resultController: UIViewController {
    @IBOutlet weak var startAgain: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!
    
    var backgroundImage = ""
    
    
    @IBOutlet weak var resultView: UIView!
    
    var getScore = 0
    //var comment = ""
    
    func changeComment() {
        switch getScore {
        case ...1:
            commentLabel.text = "Good!"
        case 2...4:
            commentLabel.text = "Nice!"
        case 5...:
                commentLabel.text = "Great!"
        default:
            commentLabel.text = "Go back to start again!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startAgain.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        resultView.layer.cornerRadius = 20
        scoreLabel.text = "X \(getScore)"
        backgroundView.image = UIImage(named: backgroundImage)
        changeComment()
        
    }
    
    @objc func dismissView(){
        dismiss(animated: true, completion: nil)
        //startController로 돌아가게 수정
    }
    
}
