//
//  LoadingView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 08/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class LoadingView: UIView
{

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .black
        
        let gifURL : String = "https://github.com/Laurens-VB/Laurens-VB.github.io/blob/main/SpinningPok%C3%A9Ball.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 20.0, y: 0, width: 50  ,height: 50)
        addSubview(imageView3)
        
        backgroundColor = .blue
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        //(Slightly modified, but) Credit to: https://javedmultani16.medium.com/how-to-load-gif-image-in-swift
        
        
    }
}
