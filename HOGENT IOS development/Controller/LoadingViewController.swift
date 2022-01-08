//
//  LoadingViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 08/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController
{
    let loadingView : LoadingView = LoadingView(
        frame: CGRect(
            x : 0
            , y : 0
            , width : UIScreen.main.bounds.width
            , height : UIScreen.main.bounds.height
        )
    )
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.addSubview(loadingView)
    }
}
