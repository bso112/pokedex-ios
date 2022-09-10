//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/10.
//

import Foundation
import UIKit

class PokemonCell : UICollectionViewCell {
    
    let pokemonImg : UIImageView  = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        contentView.addSubview(pokemonImg)
        
        pokemonImg.snp.makeConstraints{(maker) -> Void in
            maker.edges.equalTo(0)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
}
