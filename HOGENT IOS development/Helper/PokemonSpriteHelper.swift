//
//  PokemonSpriteHelper.swift
//  HOGENT IOS development
//
//  Created by LaurensVB on 06/01/2022.
//  Copyright © 2022 LaurensVB. All rights reserved.
//

import UIKit
import Foundation

class PokemonSpriteHelper
{
        
    //Volgens https://medium.com/swlh/loading-images-from-url-in-swift-2bf8b9db266
    public func setImage(from url : String) throws -> UIImageView?
    {
        let imageView : UIImageView =
        {
            let imageView = UIImageView()
            return imageView
        }()
        
        guard let imageURL = URL(string: url) else { return nil}

        // just not to cause a deadlock in UI!
        DispatchQueue.global().async
        {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async
            {
                imageView.image = image
            }
        }
        return imageView
    }
}
