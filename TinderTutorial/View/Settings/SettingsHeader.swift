//
//  SettingsHeader.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/16.
//

import UIKit
import SDWebImage

protocol SettingHeaderDelegate: class {
    func settingHeader(_ header: SettingsHeader, didSelect index: Int)
}

// UIView 하위에서는 이일을 할 수 없기 때문에 프로토콜을 정의해서 SettingController에서 대리자역할을 해줘야함

class SettingsHeader: UIView {
    
    // MARK: - Properties
    
    private let user: User
    weak var delegate: SettingHeaderDelegate?
    
    var buttons = [UIButton]()
  
    
    // MARK: - Lifecycle

    
    init(user: User) {
        self.user = user
        super.init(frame: .zero)
        
        
        backgroundColor = .systemGroupedBackground
        // 해당 뷰에 백그라운드 이미지를 줌
        
        let button1 = createButton(0)
        let button2 = createButton(1)
        let button3 = createButton(2)
        
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)

        
        addSubview(button1)
        button1.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16)
        button1.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [button2, button3])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        
        addSubview(stack)
        stack.anchor(top: topAnchor, left: button1.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 16, paddingRight: 16)
        
        loadUserPhotos()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions

    @objc func handleSelectPhoto(sender: UIButton) {
        delegate?.settingHeader(self, didSelect: sender.tag)
        
    }
    
    
    // MARK: - Helpers
    
    func loadUserPhotos() {
        
        let imageURLs = user.imageURLs.map({ URL(string: $0) })
        
        for (index, url) in imageURLs.enumerated() {
            SDWebImageManager.shared().loadImage(with: url, options: .continueInBackground, progress: nil) { (image,  a,  b,  c,  d,  e) in
                self.buttons[index].setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
    }
    
    func createButton(_ index: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Select Photo", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFill
        button.tag = index
        return button
    }

}

