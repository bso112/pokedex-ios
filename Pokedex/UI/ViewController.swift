//
//  ViewController.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/04.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let poketmonListView:  UICollectionView = {
        let layout = ColumnFlowLayout(cellsPerRow: 2, minimumInteritemSpacing: 10, minimumLineSpacing: 10, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    private var pokemonList : [Pokemon] = []
    
    private func setUpUI(){
        view.backgroundColor = .white
        
        poketmonListView.register(PokemonCell.self, forCellWithReuseIdentifier: "MyCell")
        poketmonListView.dataSource = self
        poketmonListView.delegate = self
        
        view.addSubview(poketmonListView)
        
        poketmonListView.snp.makeConstraints{(make) -> Void in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        
        PokemonService.shared.fetchPokemon().subscribe { event in
            switch event {
            case .success(let pokemon):
                DispatchQueue.main.async() {
                    self.pokemonList = pokemon
                    self.poketmonListView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async() {
                    print(error)
                }
            }
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
    }
    
    
}


extension ViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! PokemonCell
        cell.layer.cornerRadius = 20.0
        cell.layer.masksToBounds = true
        cell.backgroundColor = .red
        cell.pokemonImg.loadFrom(URLAddress: self.pokemonList[indexPath.item].getImageUrl())
        return cell
    }
    
}


extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User tapped on item \(indexPath.row)")
    }
}

extension ViewController {
    func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
