//
//  Pokemon.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 03/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class Pokemon: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let label : UILabel =
    {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Hier komt de layout code voor de label
    override func layoutSubviews()
    {
        label.frame = CGRect (
            x : 10
            , y : 10
            , width : frame.size.width - 20
            , height : frame.size.height - 20
        )
    }
    
    /*
    private let image : UIImageView =
    {
        let image = UIImageView()
        image.
        return image
    }()
    */

}
