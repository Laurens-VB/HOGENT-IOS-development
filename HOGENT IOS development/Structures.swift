//
//  Structures.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 04/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

//Models
struct Pokemon : Codable
{
    let name : String
    //let sprites : Sprites
    //let stats : Stats
    //let moves: [Moves]
    
    struct Sprites : Codable
    {
        let back_default, front_default : String
    }
    
    struct Stats : Codable
    {
        let base_stat : String
    }
    
    struct Moves: Codable
    {
        let move : Move
        struct Move: Codable
        {
            let name : String
        }
    }
}
