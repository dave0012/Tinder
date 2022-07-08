//
//  HomeNavigationStackView.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/04/27.
//

import UIKit

protocol HomeNavigationStackViewDelegate: class {
    func showSettings()
    func showMessages()
}

class HomeNavigationStackView: UIStackView {
    
    // MARK: - properties
    
    weak var delegate: HomeNavigationStackViewDelegate?
    let settingButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let tinderIcon = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
        
    // 로그인시 처음 등장하는 HomeNavigationStackView의 Propertie들 (상단버튼타입과 이미지뷰타입)
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        // 높이를 80으로 설정
        

        settingButton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "top_messages_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        
        tinderIcon.contentMode = .scaleAspectFit
        // 비율에 맞게 아이콘을 조정
        
        
        [settingButton, UIView(), tinderIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        // 3개의 propertie들을 고차함수를 이용해서 스택뷰로 묶기
        
        
        distribution = .equalCentering
        // 분배
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        settingButton.addTarget(self, action: #selector(handleShowSetting), for: .touchUpInside)
        messageButton.addTarget(self, action: #selector(handleShowMessage), for: .touchUpInside)
        // 마진주기
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 애플이 설정해논 필수생성자
    
    @objc func handleShowSetting() {
        delegate?.showSettings()
    }
    
    @objc func handleShowMessage() {
        delegate?.showMessages()
    }
}

