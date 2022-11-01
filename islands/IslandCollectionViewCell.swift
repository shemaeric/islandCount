//
//  IslandCollectionViewCell.swift
//  islands
//
//  Created by Eric Shema on 31/10/2022.
//

import UIKit

class IslandCollectionViewCell: UICollectionViewCell {
    
    let defaultBackground = UIColor(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1)
    let helper = Helper()
    let parentView = ViewController()
    
    // The Imave View for the island image
    private let islandImageView: UIImageView = {
       
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "desert-island")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        islandImageView.frame = .zero
        
        contentView.backgroundColor = defaultBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // This serves for both select and deselect.
    func select(id: Int) {
        
        let selectedValue = dataModel.findValue(id: id)
        
        // We check if value is zero and we update it to 1 and add the image of island, else remove it
        if selectedValue!.value == 0 {
            islandImageView.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
            contentView.addSubview(islandImageView)
            contentView.backgroundColor = .white
            dataModel.updateData(id: id)
            
            let islands = helper.numberOfIslands(data: dataModel.data)
            dataModel.islands = islands
            
        } else {
            islandImageView.removeFromSuperview()
            contentView.backgroundColor = defaultBackground
            dataModel.updateData(id: id)
            
            let islands = helper.numberOfIslands(data: dataModel.data)
            dataModel.islands = islands
            
        }
        
    }
    
    // Make sure that I am resetting back default view
    func reload() {
        
        islandImageView.removeFromSuperview()
        contentView.backgroundColor = defaultBackground

    }
    
}
