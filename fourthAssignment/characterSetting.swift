//
//  characterSetting.swift
//  fourthAssignment
//
//  Created by Lago on 2021/07/30.
//

import UIKit

class characterSetting {
    var name:String
    var speed:String
    var heart:String
    
    //constructor, Memo class에 대해서 content를 기입할 창을 알아서 만들어주는듯? 그럼 Date는 왜 따로쓰는거지
    init(name: String, speed: String, heart: String) {
        self.name = name
        self.speed = speed
        self.heart = heart
    }
}
