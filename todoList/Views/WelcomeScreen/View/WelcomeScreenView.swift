//
//  OnboardingView.swift
//  todoList
//
//  Created by Paulo Vitor on 08/03/23.
//

import UIKit

final class WelcomeScreenView: UIView {
    
    var buttonGetStartedTapped: (() -> Void)?
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = DSSpacing.xSmall
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "imageWelcome"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Gerencie suas tarefas"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Organize, planeje e colabore em tarefas com o Mtodo. Sua vida ocupada merece isso. você pode gerenciar a lista de verificação e seu objetivo."
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = DSColors.secondaryTextLight
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let buttonGetStarted: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = DSColors.secondary
        button.setTitle("Iniciar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .white
        stupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func stupUI() {
        buildHierarchy()
        applyConstraints()
        addTargetButton()
        setupViewBindings()
    }
    
    private func buildHierarchy() {
        addSubview(imageView)
        addSubview(stackView)
        addSubview(buttonGetStarted)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    
    private func addTargetButton() {
        buttonGetStarted.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    private func setupViewBindings() {
        buttonGetStartedTapped?()
    }
    
    @objc
    private func buttonTapped() {
        buttonGetStartedTapped?()
    }
    
    private func applyConstraints() {
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 360)

        ]
        
        let stackViewConstraints = [
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DSSpacing.medium),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.xLarge),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.xLarge),
        ]
        
        let buttonGetStartedConstraints = [
            buttonGetStarted.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonGetStarted.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            buttonGetStarted.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -DSSpacing.large),
            buttonGetStarted.heightAnchor.constraint(equalToConstant: 40)
        ]

        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(buttonGetStartedConstraints)
    }
}

extension WelcomeScreenView: WelcomeScreenViewProtocol {
    func show() {
        print("show data")
    }
}
