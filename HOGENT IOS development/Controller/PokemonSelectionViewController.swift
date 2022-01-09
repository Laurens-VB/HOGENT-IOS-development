//
//  PokemonSelectionViewController.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//
import UIKit

protocol PokemonSelectionViewControllerDelegate : class
{
    func highlighted(selection : [Pokemon])
}

class PokemonSelectionViewController: UIViewController
{
    weak var delegate : PokemonSelectionViewControllerDelegate?
    
    let pokemonGenerator : PokemonGenerator = PokemonGenerator()
    
    var pokemonOptions :  [Pokemon] = [Pokemon]()
    
    var amountPicked = 0
    
    let colorPicked = UIColor(red : 0.219, green : 0.560, blue : 0.321, alpha : 1).cgColor
    
    let pokemonSelectionView : PokemonSelectionView  = PokemonSelectionView(frame : CGRect (x : 0, y : 0,  width : UIScreen.main.bounds.width , height : UIScreen.main.bounds.height))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        do
        {
            pokemonOptions = try pokemonGenerator.genneratePokémons(amount: 6)
        }
        catch is Error { }
        
        // Do any additional setup after loading the view.
        pokemonSelectionView.setAmount(amount: 6)
        var URLs : [String] = [String]()
        for pokemonOption in pokemonOptions
        {
            URLs.append((pokemonOption.sprites?.front_default)!)
        }
        pokemonSelectionView.generateButtons(URLs: URLs)
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
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.layer.borderColor == colorPicked
        {
            tappedImage.layer.borderColor = UIColor(red : 0, green : 0, blue : 0, alpha : 1).cgColor
            amountPicked = amountPicked-1
            return
        }
        
        if tappedImage.layer.borderColor != colorPicked && amountPicked < 3
        {
            tappedImage.layer.borderColor = colorPicked
            amountPicked = amountPicked+1
            return
            
        }
    }
    
    func highlightedPokemon()
    {
        var selection : [Pokemon] = [Pokemon]()
        for (index, imageView) in pokemonSelectionView.getImageViews().enumerated()
        {
            if imageView.layer.borderColor == colorPicked
            {
                selection.append(pokemonOptions[index])
            }
        }
        print(selection)
        
        delegate?.highlighted(selection: selection)
    }
    
    @objc func confirmPressed()
    {
        let pokemonBattleViewController = PokemonBattleViewController()
        
        delegate = pokemonBattleViewController.self
        
        present(pokemonBattleViewController, animated: true, completion:  nil)
        
        highlightedPokemon()
        
    }
    
    @objc func rerollPressed()
    {
        print("REROL PRESSED xD")
        //pokemonSelectionView.generateButtons()
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
