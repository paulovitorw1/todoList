//
//  SelectLoginOrRegisterView.swift
//  todoList
//
//  Created by Paulo Vitor on 09/03/23.
//

import UIKit

class SelectLoginOrRegisterView: UIView {
    var didTappedCreateAccout: (() -> Void)?
    var didTappedLogin: (() -> Void)?
    var didTappedRegisterOrLoginFacebook: (() -> Void)?
    var didTappedRegisterOrLoginGoogle: (() -> Void)?

    private let stackViewButtons: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = DSSpacing.xSmall
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let groupRegisterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = DSSpacing.xxSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let stackViewFooter: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = DSSpacing.xSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let groupLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = DSSpacing.xxSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "phoneSecurity"))
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Comece a gerenciar sua tarefa"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "logoFacebook")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.259, green: 0.404, blue: 0.698, alpha: 1)
        button.setTitle("Facebook", for: .normal)
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    private let googleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.background.backgroundColor = .white
        config.imagePadding = 8
        let button = UIButton(configuration: config)
        let image = UIImage(named: "logoGoogle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Google", for: .normal)
        button.setImage(image, for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.setTitleColor(.gray, for: .selected)
        button.setTitleColor(.gray, for: .highlighted)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        button.layer.masksToBounds = true
        return button
    }()

    let labelDescpritonRegister: UILabel = {
        let label = UILabel()
        label.text = "Não é um membro?"
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let buttonRegisterNow: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Registra-se agora", for: .normal)
        return button

    }()
    
    let labelSeparator: UILabel = {
        let label = UILabel()
        label.text = "Ou"
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDescpritonLogin: UILabel = {
        let label = UILabel()
        label.text = "Já tem uma conta?"
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log in", for: .normal)
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
        addSubview(titleLabel)
        
        addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(googleButton)
        stackViewButtons.addArrangedSubview(facebookButton)
        
        addSubview(groupRegisterStackView)
        groupRegisterStackView.addArrangedSubview(labelDescpritonRegister)
        groupRegisterStackView.addArrangedSubview(buttonRegisterNow)

        addSubview(groupLoginStackView)
        groupLoginStackView.addArrangedSubview(labelDescpritonLogin)
        groupLoginStackView.addArrangedSubview(buttonLogin)
        addSubview(stackViewFooter)
        
        stackViewFooter.addArrangedSubview(stackViewButtons)
        stackViewFooter.addArrangedSubview(groupRegisterStackView)
        stackViewFooter.addArrangedSubview(labelSeparator)
        stackViewFooter.addArrangedSubview(groupLoginStackView)
        
    }
    
    private func addTargetButton() {
        buttonLogin.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        buttonRegisterNow.addTarget(self, action: #selector(buttonCreateAccoutTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(buttonRegisterOrLoginGoogleTapped), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(buttonRegisterOrLoginFacebookTapped), for: .touchUpInside)
    }
    
    private func setupViewBindings() {
        didTappedLogin?()
        didTappedCreateAccout?()
        didTappedRegisterOrLoginGoogle?()
        didTappedRegisterOrLoginFacebook?()
    }
    
    @objc
    private func buttonLoginTapped() {
        didTappedLogin?()
    }
    
    @objc
    private func buttonCreateAccoutTapped() {
        didTappedCreateAccout?()
    }
    
    @objc
    private func buttonRegisterOrLoginGoogleTapped() {
        didTappedRegisterOrLoginGoogle?()
    }
    
    @objc
    private func buttonRegisterOrLoginFacebookTapped() {
        didTappedRegisterOrLoginFacebook?()
    }
    private func applyConstraints() {
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -DSSpacing.xxLarge),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: DSSpacing.xxLarge),
            imageView.heightAnchor.constraint(equalToConstant: 360)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DSSpacing.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.xSmall),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.xSmall),
        ]
        
        let stackViewConstraints = [
            stackViewButtons.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DSSpacing.medium),
            stackViewButtons.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            stackViewButtons.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small),
        ]
        
        let facebookButtonConstraints = [
            facebookButton.widthAnchor.constraint(equalToConstant: 155),
            facebookButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let googleButtonConstraints = [
            googleButton.widthAnchor.constraint(equalToConstant: 155),
            googleButton.heightAnchor.constraint(equalToConstant: 48)
        ]

        let footerStackViewConstraints = [
            stackViewFooter.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackViewFooter.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: DSSpacing.large),
            stackViewFooter.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -DSSpacing.xSmall)
        ]

        stackViewFooter.setCustomSpacing(-DSSpacing.xxSmall, after: groupRegisterStackView)
        stackViewFooter.setCustomSpacing(-DSSpacing.xxSmall, after: labelSeparator)

        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(stackViewConstraints)
        NSLayoutConstraint.activate(facebookButtonConstraints)
        NSLayoutConstraint.activate(googleButtonConstraints)
        NSLayoutConstraint.activate(footerStackViewConstraints)
    }
}

extension SelectLoginOrRegisterView: SelectLoginOrRegisterViewProtocol {
    func show() {
       print("Show action")
    }
}
