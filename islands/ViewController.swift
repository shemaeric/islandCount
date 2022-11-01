//
//  ViewController.swift
//  islands
//
//  Created by Eric Shema on 31/10/2022.
//

import UIKit

let islandCount = 0
let screenWidth = UIScreen.main.bounds.width

let data = [[Int]](repeating: [0, 0, 0, 0, 0, 0], count: 60)

class ViewController: UIViewController {
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: screenWidth/7, height: screenWidth/7)
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(IslandCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.layer.cornerRadius = 4
        return view
        
    }()
    
    let resetButton: UIButton = {
       
        let button = UIButton()
        
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .darkGray
        button.layer.cornerRadius = 4
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The count for the islands
        let islandCountView = UILabel(frame: CGRect(x: 20, y: 100, width: view.frame.width, height: 40))
        islandCountView.text = "Island Count : \(islandCount)"
        islandCountView.font = .systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        islandCountView.textColor = .darkGray
        
        view.addSubview(islandCountView)
        view.addSubview(collectionView)
        view.addSubview(resetButton)
        
//        collectionView.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Collection View Constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: islandCountView.frame.maxY).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height / 1.5).isActive = true
        
        // Reset Button Constrainst
        print("the top anchor", collectionView.frame)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 1.5 + islandCountView.frame.maxY + 40).isActive = true
        
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IslandCollectionViewCell
        
//        cell.layer.borderColor = UIColor.darkGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("It was selected ----", data)
    }
    
}

