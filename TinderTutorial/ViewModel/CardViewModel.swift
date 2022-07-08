//
//  CardViewModel.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/05.
//

import UIKit

class CardViewModel {
    
    let user: User
    let imageURLs: [String]
    let userInfoText: NSAttributedString
    
    private var imageIndex = 0
    var index: Int { return imageIndex }
    
    var imageUrl: URL?
    
    //lazy var imageToShow = user.images.first
    // 배열의 첫번째 이미지를 imageToShow에 초기화
   
    init(user: User) {
        self.user = user
        
        let attributedText = NSMutableAttributedString(string: user.name,
                                                       attributes: [.font:UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        // 글씨체,폰트크기 등 옵션을 선택할수 있는 클래스
        
        attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white]))
        
        self.userInfoText = attributedText
        
        //self.imageUrl = URL(string: user.profileImageUrl)
        self.imageURLs = user.imageURLs
        self.imageUrl = URL(string: self.imageURLs[0])
    }
    // 파라미터로 User 구조체로 초기화를 하는 들어가는 CardViewModel 생성
    
    func showNextPhoto() {
        print(#function)
        guard imageIndex < imageURLs.count - 1 else { return }
        imageIndex += 1
        imageUrl = URL(string: imageURLs[imageIndex])
    }
//     imageIndex가 유저 이미지의 배열의 -1 보다 작을시에 imageIndex에 1을 추가
//
    
    
    func showPreviousPhoto() {
        print(#function)
        guard imageIndex > 0 else { return }
        imageIndex -= 1
        imageUrl = URL(string: imageURLs[imageIndex])

    }
}
