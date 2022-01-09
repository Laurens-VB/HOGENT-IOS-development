//
//  PokemonMoveHelperUX.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 09/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation
import UIKit

class PokemonMoveHelperUX
{
    func determineLayout(type : String) -> UIColor
    {
        switch type
        {
            case "normal"   :     return UIColor(red : 176/255, green : 195/255, blue : 193/255, alpha : 1)
            case "fire"     :     return UIColor(red : 245/255, green : 142/255, blue : 7/255,   alpha : 1)
            case "fighting" :     return UIColor(red : 177/255, green : 46/255,  blue : 15/255,  alpha : 1)
            case "water"    :     return UIColor(red : 14/255,  green : 172/255, blue : 214/255, alpha : 1)
            case "flying"   :     return UIColor(red : 150/255, green : 197/255, blue : 153/255, alpha : 1)
            case "grass"    :     return UIColor(red : 46/255,  green : 163/255, blue : 83/255,  alpha : 1)
            case "poison"   :     return UIColor(red : 116/255, green : 46/255,  blue : 163/255, alpha : 1)
            case "electric" :     return UIColor(red : 201/255, green : 195/255, blue : 22/255,  alpha : 1)
            case "ground"   :     return UIColor(red : 128/255, green : 87/255,  blue : 59/255,  alpha : 1)
            case "psychic"  :     return UIColor(red : 199/255, green : 88/255,  blue : 171/255, alpha : 1)
            case "rock"     :     return UIColor(red : 166/255, green : 144/255, blue : 94/255,  alpha : 1)
            case "ice"      :     return UIColor(red : 57/255,  green : 126/255, blue : 145/255, alpha : 1)
            case "bug"      :     return UIColor(red : 62/255,  green : 99/255,  blue : 44/255,  alpha : 1)
            case "dragon"   :     return UIColor(red : 38/255,  green : 39/255,  blue : 150/255, alpha : 1)
            case "ghost"    :     return UIColor(red : 61/255,  green : 13/255,  blue : 87/255,  alpha : 1)
            case "dark"     :     return UIColor(red : 46/255,  green : 41/255,  blue : 39/255,  alpha : 1)
            case "steel"    :     return UIColor(red : 107/255, green : 100/255, blue : 97/255,  alpha : 1)
            case "fairy"    :     return UIColor(red : 219/255, green : 68/255,  blue : 151/255, alpha : 1)
            default:              return UIColor(red : 15/255,  green : 102/255, blue : 99/255,  alpha : 1)
        }
    }
}
