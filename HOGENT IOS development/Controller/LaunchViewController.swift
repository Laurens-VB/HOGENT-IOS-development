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
    func highlighted(selection : [Pokemon], imageViews : [UIImageView] )
}

class LaunchViewController : UIViewController
{
    weak var delegate : PokemonSelectionViewControllerDelegate?
    
    var streak = 0
    
    let pokemonGenerator : PokemonGenerator = PokemonGenerator()
    
    var pokemonOptions :  [Pokemon] = [Pokemon]()
    
    var amountPicked = 0
    
    let colorPicked = UIColor(red : 84/255, green : 135/255, blue : 81/255, alpha : 1).cgColor
    
    var pokemonSelectionView : PokemonSelectionView? = nil
    
    override func viewDidLoad()
    {
        print("VDL")
        super.viewDidLoad()
        
        do
        {
            pokemonOptions = try pokemonGenerator.genneratePokémons(amount: 6)
        }
        catch is Error { }
        
        // Do any additional setup after loading the view.
        var URLs : [String] = [String]()
        for pokemonOption in pokemonOptions
        {
            URLs.append((pokemonOption.sprites?.front_default)!)
        }
             pokemonSelectionView = PokemonSelectionView(frame : CGRect (x : 0, y : 0,  width : UIScreen.main.bounds.width , height : UIScreen.main.bounds.height)
                , URLs : URLs)
        
        view.addSubview(pokemonSelectionView!)
    }
    
    func generatePokemonImages()
    {
        do
        {
            pokemonOptions = try pokemonGenerator.genneratePokémons(amount: 6)
        }
        catch is Error { }
        
        // Do any additional setup after loading the view.
        pokemonSelectionView!.setAmount(amount: 6)
        var URLs : [String] = [String]()
        for pokemonOption in pokemonOptions
        {
            URLs.append((pokemonOption.sprites?.front_default)!)
        }
    }
    
    override func viewDidLayoutSubviews()
    {
        for imageView in pokemonSelectionView!.getImageViews()
        {
            //Volgens https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift
            let tapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(imageTapped(tapGestureRecognizer:)))
            
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        pokemonSelectionView!.buttonConfirm.addTarget(self, action: #selector(confirmPressed), for: .touchUpInside )
        
        pokemonSelectionView!.buttonReroll.addTarget(self, action: #selector(rerollPressed), for: .touchUpInside )
    }
    
    //Skelet functie volgens https://stackoverflow.com/questions/27880607/how-to-assign-an-action-for-uiimageview-object-in-swift
    @objc func imageTapped(tapGestureRecognizer : UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if tappedImage.backgroundColor!.cgColor == colorPicked
        {
            tappedImage.layer.backgroundColor = UIColor(red : 164/255, green : 176/255, blue : 171/255, alpha : 1).cgColor
            amountPicked = amountPicked-1
            
            pokemonSelectionView!.lockConfirmButton()
            
            return
        }
        
        if tappedImage.layer.backgroundColor != colorPicked && amountPicked < 3
        {
            tappedImage.backgroundColor = UIColor(cgColor : colorPicked)
            amountPicked = amountPicked+1
            
            if amountPicked == 3
            {
                print("unlocking confirm button!")
                pokemonSelectionView!.unlockConfirmButton()
            }
            return
        }
        
        
    }
    
    func highlightedPokemon()
    {
        var selection : [Pokemon] = [Pokemon]()
        print(pokemonSelectionView!.getImageViews().count)
        print(pokemonOptions.count)
        
        for (index, imageView) in pokemonSelectionView!.getImageViews().enumerated()
        {
            if imageView.backgroundColor == UIColor(cgColor : colorPicked)
            {
                selection.append(pokemonOptions[index])
            }
        }
        print(selection)
        
        delegate?.highlighted(selection: selection, imageViews: pokemonSelectionView!.getImageViews())
    }
    
    func clearPokemon()
    {
        print("clearing pokémon")
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
        pokemonSelectionView?.imageViews = [UIImageView]()
        amountPicked = 0
        var pokemons : [Pokemon]? = nil
        do
        {
            pokemons = try pokemonGenerator.genneratePokémons(amount : 6)
        }
        catch is Error {}
        
        self.pokemonOptions = pokemons!
        
        var URLs : [String] = [String]()
        for pokemon in pokemons!
        {
            URLs.append((pokemon.sprites?.front_default)!)
        }
        
        pokemonSelectionView?.reroll(URLs: URLs)
        
        viewDidLayoutSubviews()
        
        print("rerol be done")
    }
    
    func updateStreak()
    {
        print(streak)
        pokemonSelectionView?.updateStreak(streak: streak)
        
    }
}

extension LaunchViewController : PokemonBattleViewControllerDelegate
{
    func isGewonnen(isGewonnen: Bool)
    {
        print("delegate gang")
        
        if isGewonnen
        {
            self.streak = streak + 1
        }
        else
        {
            self.streak = 0
        }
    }
    
    
}
