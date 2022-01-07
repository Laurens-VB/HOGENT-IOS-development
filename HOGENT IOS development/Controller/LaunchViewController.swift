//
//  LaunchViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        let screenSize: CGRect = UIScreen.main.bounds
        let launchView = LaunchView(frame : CGRect (x : 0, y : 0,  width : screenSize.width , height : screenSize.height))
        
        launchView.buttonOk.addTarget(self, action: #selector(okPressed), for: .touchUpInside )
            
        view.addSubview(launchView)
        print("PAIN")
    }
    
    @objc func okPressed()
    {
        let pokémonViewController = PokemonSelectionViewController()
        present(pokémonViewController, animated: true, completion:  nil)
    }
}
