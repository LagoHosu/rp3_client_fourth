//
//  resultController.swift
//  fourthAssignment
//
//  Created by Lago on 2021/07/29.
//

import UIKit

class resultController: UIViewController {
    @IBOutlet weak var startAgain: UIButton!
    var backgroundImage = UIImage()
    
    @IBOutlet weak var resultView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startAgain.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        resultView.layer.cornerRadius = 20
    }

    @objc func dismissView(){
          dismiss(animated: true, completion: nil)
      }

}
