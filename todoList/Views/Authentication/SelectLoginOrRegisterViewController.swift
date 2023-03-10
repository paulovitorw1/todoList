//
//  SelectLoginOrRegisterViewController.swift
//  todoList
//
//  Created by Paulo Vitor on 09/03/23.
//

import UIKit

class SelectLoginOrRegisterViewController: UIViewController {

    weak var delegate: SelectLoginOrRegisterViewControllerDelegate?
    
    var contentView: SelectLoginOrRegisterViewProtocol
    
    init(contentView: SelectLoginOrRegisterViewProtocol = SelectLoginOrRegisterView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView

        setupViewBindings()
    }
    
    private func setupViewBindings() {
        contentView.didTappedCreateAccout = { [weak self] in
            print("Create Accout")
        }
        
        contentView.didTappedLogin = { [weak self] in
            print("Redirect to login")
        }
        
        contentView.didTappedRegisterOrLoginGoogle = { [weak self] in
            print("Create or login with google")
        }
        
        contentView.didTappedRegisterOrLoginFacebook = { [weak self] in
            print("Create or login with facebook")
        }
    }
}

