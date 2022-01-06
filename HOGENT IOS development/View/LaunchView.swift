//
//  LaunchView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class LaunchView: UIView
{
    private let labelWelcome : UILabel =
    {
        let labelWelcome = UILabel()
        labelWelcome.text = "Welcome to the battle factory simulator!"
        labelWelcome.textAlignment = .center
        return labelWelcome
    }()
    
    private let labelName: UILabel =
    {
        let labelName = UILabel()
        labelName.text = "Please enter your name"
        labelName.textAlignment = .center
        return labelName
    }()
    
    private let textField : UITextField =
    {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .white
        textField.contentHorizontalAlignment = .center
        return textField
    }()
    
    let buttonOk : UIButton =
    {
        let buttonOk = UIButton()
        buttonOk.backgroundColor = .systemGreen
        buttonOk.setTitle("OK", for : .normal)
        return buttonOk
    }()
    
    private let launchImage : UIImageView =
    {
        let launchImage = UIImageView()
        launchImage.image = UIImage(named: "pikachu")
        return launchImage
    }()
    
    override init(frame : CGRect)
     {
         super.init(frame : frame)
         backgroundColor = .yellow
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        labelWelcome.frame = CGRect(
            x : 0
            , y : (frame.size.height/2)-(4*30)
            , width: frame.size.width
            , height: 30
        )
        
        labelName.frame = CGRect(
            x : 0
            , y : labelWelcome.frame.maxY + 10
            , width: frame.size.width
            , height : 30
        )
        
        textField.frame = CGRect(
            x : (frame.size.width/2) - (250/2)
            , y : labelName.frame.maxY + 10
            , width : 250
            , height : 30
        )
        
        buttonOk.frame = CGRect(
            x : (frame.size.width/2) - (50/2)
            , y : textField.frame.maxY + 10
            , width: 50
            , height: 30
        )
        
        launchImage.frame = CGRect(
            x : (frame.size.width/2) - (221/2)
            , y : buttonOk.frame.maxY + 10
            , width : 221
            , height : 292
        )
        
        addSubview(labelWelcome)
        addSubview(labelName)
        addSubview(textField)
        addSubview(buttonOk)
        addSubview(launchImage)
    }
}
