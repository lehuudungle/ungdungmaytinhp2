//
//  OperatorsButton.swift
//  Giaodien_maytinh1
//
//  Created by Admin on 9/21/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class OperatorsButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    func configureButton() -> Void {
        
        if tag == 101{
            backgroundColor = UIColor.init(red: 245/255, green: 165/255, blue: 34/255, alpha: 1)
        }else{
            backgroundColor = UIColor.init(red: 116/255, green: 219/255, blue: 110/255, alpha: 1)
        }
        
        layer.cornerRadius = 8.0
        titleLabel?.font = UIFont.systemFontOfSize(20)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }

}
