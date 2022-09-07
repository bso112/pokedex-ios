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
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 60)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    
    private func setUpUI(){
        view.backgroundColor = .white
        
        poketmonListView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        poketmonListView.dataSource = self
        poketmonListView.delegate = self
    
        let lable = UILabel()
        
        view.addSubview(poketmonListView)
        view.addSubview(lable)
        
        poketmonListView.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(self.view).offset(30)
            make.height.equalTo(100)
            make.width.equalTo(300)
        }
        
        lable.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(poketmonListView.snp.bottom).offset(30)
            make.height.lessThanOrEqualTo(self.view)
            make.width.lessThanOrEqualTo(self.view)
        }
        
        PokemonService.shared.fetchPokemon().subscribe{ event in
            switch event {
            case .success(let pokemon):
                DispatchQueue.main.async() {
                    lable.text = pokemon.first?.name ?? ""
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
        return 9
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = .red
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
