//
//  SelectLoginOrRegisterProtocol.swift
//  todoList
//
//  Created by Paulo Vitor on 09/03/23.
//

import UIKit

protocol SelectLoginOrRegisterViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol SelectLoginOrRegisterViewProtocol: UIView {
    var didTappedCreateAccout: (() -> Void)? { get set }
    var didTappedLogin: (() -> Void)? { get set }
    var didTappedRegisterOrLoginFacebook: (() -> Void)? { get set }
    var didTappedRegisterOrLoginGoogle: (() -> Void)? { get set }

    func show()
}


