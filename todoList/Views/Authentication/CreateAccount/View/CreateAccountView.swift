//
//  CreateAccountView.swift
//  todoList
//
//  Created by Paulo Vitor on 10/03/23.
//

import UIKit

final class CreateAccountView: UIView {
    var didTappedCreateAccount: ((CreateAccountViewModel) -> Void)?
    var didTappedToLogin: (() -> Void)?
    var didTappedTogglePasswordVisibility: (() -> Void)?

    private let headerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let textFieldStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = DSSpacing.xSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let groupLoginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = DSSpacing.xxSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let headerTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Olá!"
        label.font = .preferredFont(forTextStyle: .title1)
        label.textColor = DSColors.secondaryShades
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let headerSubTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Bem-vindo ao aplicativo nameApp Inscreva-se para começar."
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = DSColors.secondaryShades
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let nameTextField: TextFieldWithPadding = {
       let textField = TextFieldWithPadding()
        textField.placeholder = "Digite seu nome"
        textField.textContentType = .name
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let emailTextField: TextFieldWithPadding = {
       let textField = TextFieldWithPadding()
        textField.placeholder = "Digite seu e-mail"
        textField.textContentType = .emailAddress
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: TextFieldWithPadding = {
       let textField = TextFieldWithPadding()
        textField.placeholder = "Digite sua senha"
        textField.textContentType = .newPassword
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        textField.layer.cornerRadius = 12
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private let descriptionTermsLabel: UILabel = {
        let label = UILabel()
        label.text = "ao se inscrever você concorda com nossos termos e condições de uso e política de privacidade."
        label.numberOfLines = 0
        label.textColor = DSColors.grey
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Inscrever-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = DSColors.secondary
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let loginDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Já tem uma conta?"
        label.font = UIFont.systemFont(ofSize: 14, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        return button

    }()
    
    private let passwordOverlayButton: UIButton = {
        let overlayButton = UIButton(type: .custom)
        let bookmarkImage = UIImage(systemName: "eye.slash")
        overlayButton.setImage(bookmarkImage, for: .normal)
        overlayButton.tintColor = DSColors.grey
        overlayButton.sizeToFit()
        return overlayButton
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
        passwordTextField.rightView = passwordOverlayButton
        passwordTextField.rightViewMode = .always
    }
    
    private func buildHierarchy() {
        addSubview(headerStackView)
        headerStackView.addArrangedSubview(headerTitleLabel)
        headerStackView.addArrangedSubview(headerSubTitleLabel)
        
        addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(nameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        addSubview(descriptionTermsLabel)
        addSubview(registerButton)
        
        addSubview(groupLoginStackView)
        groupLoginStackView.addArrangedSubview(loginDescriptionLabel)
        groupLoginStackView.addArrangedSubview(loginButton)
    }
    
    private func addTargetButton() {
        loginButton.addTarget(self, action: #selector(buttonToLogin), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(buttonRegister), for: .touchUpInside)
        passwordOverlayButton.addTarget(self, action: #selector(buttonTogglePasswordVisibility), for: .touchUpInside)

        //KeyBoard
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard)))
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyBoard), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    private func setupViewBindings() {
        didTappedToLogin?()
        didTappedCreateAccount?(CreateAccountViewModel(name: "",
                                                       email: "",
                                                       password: ""))
    }

    @objc
    private func hideKeyBoard() {
        self.endEditing(true)
    }

    @objc
    private func keyBoardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {

            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.frame.height - (groupLoginStackView.frame.origin.y + groupLoginStackView.frame.height)
            self.frame.origin.y -= keyboardHeight - bottomSpace + 10
        }
    }

    @objc
    private func buttonToLogin() {
        didTappedToLogin?()
    }
    
    @objc
    private func buttonRegister() {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }

        let viewModel = CreateAccountViewModel(name: name, email: email, password: password)

        didTappedCreateAccount?(viewModel)
    }

    @objc
    private func buttonTogglePasswordVisibility() {
        didTappedTogglePasswordVisibility?()
    }

    private func applyConstraints() {
        let headerStackViewConstraints = [
            headerStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DSSpacing.xLarge),
            headerStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: DSSpacing.xxxLarge),
            headerStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -DSSpacing.xxxLarge)
        ]
        
        let textFieldStackViewConstraints = [
            textFieldStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: DSSpacing.large),
            textFieldStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            textFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small)
        ]
        
        let nameTextFieldContraints = [
            nameTextField.widthAnchor.constraint(equalTo: textFieldStackView.widthAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor, constant: 0),
            nameTextField.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor, constant: 0)
        ]
        
        let emailTextFieldContraints = [
            emailTextField.widthAnchor.constraint(equalTo: textFieldStackView.widthAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor, constant: 0),
            emailTextField.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor, constant: 0)
        ]
        
        let passwordTextFieldContraints = [
            passwordTextField.widthAnchor.constraint(equalTo: textFieldStackView.widthAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor, constant: 0),
            passwordTextField.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor, constant: 0)
        ]
        
        let descriptionTermsLabelContraints = [
            descriptionTermsLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: DSSpacing.xSmall),
            descriptionTermsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            descriptionTermsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small)
        ]
        
        let registerButtonConstraints = [
            registerButton.topAnchor.constraint(equalTo: descriptionTermsLabel.bottomAnchor, constant: DSSpacing.large),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DSSpacing.small),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DSSpacing.small),
            registerButton.heightAnchor.constraint(equalToConstant: 48)
        ]
        
        let footerStackViewConstraints = [
            groupLoginStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            groupLoginStackView.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: DSSpacing.small)
        ]
        
        NSLayoutConstraint.activate(nameTextFieldContraints)
        NSLayoutConstraint.activate(emailTextFieldContraints)
        NSLayoutConstraint.activate(passwordTextFieldContraints)
        NSLayoutConstraint.activate(headerStackViewConstraints)
        NSLayoutConstraint.activate(textFieldStackViewConstraints)
        NSLayoutConstraint.activate(descriptionTermsLabelContraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
        NSLayoutConstraint.activate(footerStackViewConstraints)

    }
    
}

extension CreateAccountView: CreateAccountViewProtocol {
    func show(_ viewModel: TogglePasswordVisibilityViewModel) {
        togglePasswordVisibility(viewModel)
    }

    func togglePasswordVisibility(_ viewModel: TogglePasswordVisibilityViewModel) {
        passwordTextField.isSecureTextEntry = viewModel.toggleTextFieldEntry
        passwordOverlayButton.setImage(UIImage(systemName: viewModel.icon), for: .normal)
    }
}
