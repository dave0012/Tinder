//
//  BottomControllStackView.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/03.
//

import UIKit

protocol BottomControlsStaclViewDelegate: class {
    func handleLike()
    func handleDislike()
    func handleRefresh()
}

class BottomControllStackView: UIStackView {
    
    // MARK: - properties
    
    weak var delegate: BottomControlsStaclViewDelegate?
    
    let refreshButton = UIButton(type: .system)
    let dislikeButton = UIButton(type: .system)
    let superlikeButton = UIButton(type: .system)
    let likeButton = UIButton(type: .system)
    let boostButton = UIButton(type: .system)
    
    //하단의 BottomControllStackView 의 propertie들 (버튼타입)
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        //높이 설정
        distribution = .fillEqually
        //propertie들을 균등하게 설정
        
        
        refreshButton.setImage(#imageLiteral(resourceName: "refresh_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        dislikeButton.setImage(#imageLiteral(resourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        superlikeButton.setImage(#imageLiteral(resourceName: "super_like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        boostButton.setImage(#imageLiteral(resourceName: "boost_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        
        refreshButton.addTarget(self, action: #selector(handleRefresh), for: .touchUpInside)
        dislikeButton.addTarget(self, action: #selector(handleDislike), for: .touchUpInside)
        likeButton.addTarget(self, action: #selector(handleLike), for: .touchUpInside)

        
        [refreshButton, dislikeButton, superlikeButton, likeButton, boostButton].forEach { view in
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleRefresh() {
        delegate?.handleRefresh()
        
    }
    
    @objc func handleDislike() {
        delegate?.handleDislike()
    }
    
    @objc func handleLike() {
        delegate?.handleLike()
        
    }
    
    
    
}

