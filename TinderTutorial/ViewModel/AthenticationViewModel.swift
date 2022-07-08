//
//  AthenticationViewModel.swift
//  TinderTutorial
//
//  Created by 민호 on 2022/05/10.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsVaild: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false
    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    
    var email: String?
    var fullname: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false &&
        fullname?.isEmpty == false
    }
}
