//
//  Battle.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 08/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import Foundation

class Battle
{
    private var alyTeam : [Pokemon] = [Pokemon] ()
    private var enemyTeam : [Pokemon] = [Pokemon]()
    
    init(alyTeam : [Pokemon], enemyTeam :  [Pokemon])
    {
        self.alyTeam = alyTeam
        self.enemyTeam = enemyTeam
    }
    
    func getAlyTeam() -> [Pokemon]
    {
        return alyTeam
    }
    
    func getEnemyTeam() -> [Pokemon]
    {
        return enemyTeam
    }
    
    func start() -> Void
    {
            //Not Yet implemented
    }
    
    func turn() -> Void
    {
        //not yet implemented
    }
    
    
    
}
