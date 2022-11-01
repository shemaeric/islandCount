//
//  IslandCollectionViewCell.swift
//  islands
//
//  Created by Eric Shema on 31/10/2022.
//

import UIKit

class IslandCollectionViewCell: UICollectionViewCell {
    
    private let islandImageView: UIImageView = {
       
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "desert-island")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        islandImageView.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        contentView.addSubview(islandImageView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
