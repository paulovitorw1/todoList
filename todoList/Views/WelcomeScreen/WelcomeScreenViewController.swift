//
//  OnboardingViewController.swift
//  todoList
//
//  Created by Paulo Vitor on 08/03/23.
//

import UIKit

final class WelcomeScreenViewController: UIViewController {
    var delegate: WelcomeScreenViewControllerDelegate?
    var contentView: WelcomeScreenViewProtocol
    
    init(contentView: WelcomeScreenViewProtocol = WelcomeScreenView()) {
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
        contentView.buttonGetStartedTapped = { [weak self] in
            self?.delegate?.didToLogin()
        }
    }
}
