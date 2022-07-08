//
//  ProfileCell.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/18.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "jane1")
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


