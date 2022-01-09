//
//  TypeChart.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 09/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

struct TypeChart
{
    
}

struct Normal
{
        let normal : Double =  1
        let fire : Double =  1
        let water : Double =  1
        let electric : Double =  1
        let grass : Double =  1
        let ice : Double =  1
        let fighting : Double =  1
        let poison : Double =  1
        let ground : Double =  1
        let flying : Double =  1
        let psychic : Double =  1
        let bug : Double =  1
        let rock : Double =  0.5
        let ghost : Double =  0
        let dragon : Double =  1
        let dark : Double =  1
        let steel : Double =  0.5
}

struct Fire
{
        let normal : Double =  1
        let fire : Double =  0.5
        let water : Double =  0.5
        let electric : Double =  1
        let grass : Double =  2
        let ice : Double =  2
        let fighting : Double =  1
        let poison : Double =  1
        let ground : Double =  1
        let flying : Double =  1
        let psychic : Double =  1
        let bug : Double =  2
        let rock : Double =  0.5
        let ghost : Double =  1
        let dragon : Double =  0.5
        let dark : Double =  1
        let steel : Double =  2
}
 
struct  Water
{
       let normal : Double =  1
       let fire : Double =  2
       let water : Double =  0.5
       let electric : Double =  1
       let grass : Double =  0.5
       let ice : Double =  1
       let fighting : Double =  1
       let poison : Double =  1
       let ground : Double =  2
       let flying : Double =  1
       let psychic : Double =  1
       let bug : Double =  1
       let rock : Double =  2
       let ghost : Double =  1
       let dragon : Double =  0.5
       let dark : Double =  1
       let steel : Double =  1
    
}

struct  electric
{
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  2
   let electric : Double =  0.5
   let grass : Double =  0.5
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  0
   let flying : Double =  2
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  1
   let dragon : Double =  0.5
   let dark : Double =  1
   let steel : Double =  1
}

struct grass
{
   let normal : Double =  1
   let fire : Double =  0.5
   let water : Double =  2
   let electric : Double =  1
   let grass : Double =  0.5
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  0.5
   let ground : Double =  2
   let flying : Double =  0.5
   let psychic : Double =  1
   let bug : Double =  0.5
   let rock : Double =  2
   let ghost : Double =  1
   let dragon : Double =  0.5
   let dark : Double =  1
   let steel : Double =  0.5
}

struct ice
{
   let normal : Double =  1
   let fire : Double =  0.5
   let water : Double =  0.5
   let electric : Double =  1
   let grass : Double =  2
   let ice : Double =  0.5
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  2
   let flying : Double =  2
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  1
   let dragon : Double =  2
   let dark : Double =  1
   let steel : Double =  0.5
}

 struct fighting
 {
   let normal : Double =  2
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  2
   let fighting : Double =  1
   let poison : Double =  0.5
   let ground : Double =  1
   let flying : Double =  0.5
   let psychic : Double =  0.5
   let bug : Double =  0.5
   let rock : Double =  2
   let ghost : Double =  0
   let dragon : Double =  1
   let dark : Double =  2
   let steel : Double =  2
}

struct poison
{
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  2
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  0.5
   let ground : Double =  0.5
   let flying : Double =  1
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  0.5
   let ghost : Double =  0.5
   let dragon : Double =  1
   let dark : Double =  1
   let steel : Double =  0
}

struct ground
{
   let normal : Double =  1
   let fire : Double =  2
   let water : Double =  1
   let electric : Double =  2
   let grass : Double =  0.5
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  2
   let ground : Double =  1
   let flying : Double =  0
   let psychic : Double =  1
   let bug : Double =  0.5
   let rock : Double =  2
   let ghost : Double =  1
   let dragon : Double =  1
   let dark : Double =  1
   let steel : Double =  2
}

struct flying
{
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  0.5
   let grass : Double =  2
   let ice : Double =  1
   let fighting : Double =  2
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  1
   let bug : Double =  2
   let rock : Double =  0.5
   let ghost : Double =  1
   let dragon : Double =  1
   let dark : Double =  1
   let steel : Double =  0.5
}
 struct psychic
 {
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  1
   let fighting : Double =  2
   let poison : Double =  2
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  0.5
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  1
   let dragon : Double =  1
   let dark : Double =  0
   let steel : Double =  0.5
}

struct bug
{
   let normal : Double =  1
   let fire : Double =  0.5
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  2
   let ice : Double =  1
   let fighting : Double =  0.5
   let poison : Double =  0.5
   let ground : Double =  1
   let flying : Double =  0.5
   let psychic : Double =  2
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  0.5
   let dragon : Double =  1
   let dark : Double =  2
   let steel : Double =  0.5
}

 struct rock
 {
   let normal : Double =  1
   let fire : Double =  2
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  2
   let fighting : Double =  0.5
   let poison : Double =  1
   let ground : Double =  0.5
   let flying : Double =  2
   let psychic : Double =  1
   let bug : Double =  2
   let rock : Double =  1
   let ghost : Double =  1
   let dragon : Double =  1
   let dark : Double =  1
   let steel : Double =  0.5
}

 struct ghost
 {
   let normal : Double =  0
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  2
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  2
   let dragon : Double =  1
   let dark : Double =  0.5
   let steel : Double =  0.5
}

struct dragon
{
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  1
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  1
   let dragon : Double =  2
   let dark : Double =  1
   let steel : Double =  0.5
}

struct dark
{
   let normal : Double =  1
   let fire : Double =  1
   let water : Double =  1
   let electric : Double =  1
   let grass : Double =  1
   let ice : Double =  1
   let fighting : Double =  0.5
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  2
   let bug : Double =  1
   let rock : Double =  1
   let ghost : Double =  2
   let dragon : Double =  1
   let dark : Double =  0.5
   let steel : Double =  0.5
}

 struct steel
 {
   let normal : Double =  1
   let fire : Double =  0.5
   let water : Double =  0.5
   let electric : Double =  0.5
   let grass : Double =  1
   let ice : Double =  2
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  2
   let ghost : Double =  1
   let dragon : Double =  1
   let dark : Double =  1
   let steel : Double =  0.5
}

 struct fairy
 {
   let normal : Double =  1
   let fire : Double =  0.5
   let water : Double =  0.5
   let electric : Double =  0.5
   let grass : Double =  1
   let ice : Double =  2
   let fighting : Double =  1
   let poison : Double =  1
   let ground : Double =  1
   let flying : Double =  1
   let psychic : Double =  1
   let bug : Double =  1
   let rock : Double =  2
   let ghost : Double =  1
   let dragon : Double =  0
   let dark : Double =  1
   let steel : Double =  2
}
