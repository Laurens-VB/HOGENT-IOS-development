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
    let sprites : Sprites?
    //let stats : Stats
    var moves: [Moves]?
    
    struct Sprites : Codable
    {
        let back_default, front_default : String?
    }
    
    struct Stats : Codable
    {
        let base_stat : Int?
    }
}

struct Moves: Codable
{
    let move : Move?
    
    struct Move: Codable
    {
        let name : String?
    }
}

struct MoveDetail : Codable
{
    let name : String
    var accuracy : Int?
    var power : Int?
    let type : Type?
}

struct Type : Codable
{
    let name : String
}
