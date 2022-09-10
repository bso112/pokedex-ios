//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/10.
//

import Foundation
import UIKit
import SwiftUI

class PokemonCell : UICollectionViewCell {
    
    let pokemonImg = UIImageView()
    let pokemonName : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let container = UIView()
        container.backgroundColor = .green
        container.addSubview(pokemonImg)
        container.addSubview(pokemonName)
        
        contentView.addSubview(container)
        
        container.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        pokemonImg.snp.makeConstraints{(maker) -> Void in
            maker.center.equalToSuperview()
            maker.width.equalTo(130)
            maker.height.equalTo(130)
        }
        
        pokemonName.snp.makeConstraints{(maker) -> Void in
            maker.top.equalTo(pokemonImg.snp.bottom)
            maker.bottom.equalToSuperview()
            maker.centerX.equalTo(contentView)
        }
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
}

struct PokemonCellPresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> PokemonCell {
        return PokemonCell()
    }
    
    func updateUIView(_ uiView: PokemonCell, context: Context) {
        
    }
    
    typealias UIViewType = PokemonCell
    
}
 



//struct PokemonCell_Previews: PreviewProvider {
//    static var previews: some View {
//        let cell = PokemonCell()
//        cell.pokemonImg.image = UIImage(named: "Mock_Pokemon.png")
//        cell.pokemonName.text = "pikachu"
//        return Group{
//            PokemonCellPresentable()
//                .ignoresSafeArea()
//                .previewDisplayName("main")
//                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
//        }
//    }
//}
