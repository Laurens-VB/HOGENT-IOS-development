//
//  PokemonSelectionViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit

class PokemonSelectionViewController: UIViewController
{
    //@IBOutlet weak var imageViews : [UIImageView]!

    //Andere plaats zoeken!
    var amountPicked = 0
    
    
    let pokemonSelectionView : PokemonSelectionView  = PokemonSelectionView(frame : CGRect (x : 0, y : 0,  width : UIScreen.main.bounds.width , height : UIScreen.main.bounds.height))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        pokemonSelectionView.setAmount(amount: 6)
        pokemonSelectionView.generateButtons()
        view.addSubview(pokemonSelectionView)
        
    }
    
    override func viewDidLayoutSubviews()
    {
        print("ViewDidLayout runned")
        for imageView in pokemonSelectionView.getImageViews()
        {
            //Volgens https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift
            let tapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(imageTapped(tapGestureRecognizer:)))
            
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        pokemonSelectionView.buttonConfirm.addTarget(self, action: #selector(confirmPressed), for: .touchUpInside )
        
        pokemonSelectionView.buttonReroll.addTarget(self, action: #selector(rerollPressed), for: .touchUpInside )
    }
    
    //Skelet functie volgens https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift
    @objc func imageTapped(tapGestureRecognizer : UITapGestureRecognizer)
    {
        print("heh")
        let colorPicked = UIColor(red : 0.219, green : 0.560, blue : 0.321, alpha : 1).cgColor
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.layer.borderColor == colorPicked
        {
            print("Remove")
            tappedImage.layer.borderColor = UIColor(red : 0, green : 0, blue : 0, alpha : 1).cgColor
            amountPicked = amountPicked-1
            return
        }
        
        if tappedImage.layer.borderColor != colorPicked && amountPicked < 3
        {
            print("Add")
            tappedImage.layer.borderColor = colorPicked
            amountPicked = amountPicked+1
            return
            
        }
    }
    
    @objc func confirmPressed()
    {
        let pokemonBattleSceneViewController = PokemonBattleSceneViewController()
        let pokemonBattleOptionsViewController = PokemonBattleOptionsViewController()
        present(pokemonBattleSceneViewController, animated: true, completion:  nil)
        //present(pokemonBattleOptionsViewController, animated: true, completion: nil)
    }
    
    @objc func rerollPressed()
    {
        pokemonSelectionView.generateButtons()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
