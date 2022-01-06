//
//  PokemonBattleOptionsView.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonBattleOptionsView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var buttons : [UIButton] = []
    
    override init(frame : CGRect)
    {
        super.init(frame : frame)
        backgroundColor = .purple
        
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }}
