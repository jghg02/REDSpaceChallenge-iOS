//
//  ModalViewController.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 07-12-21.
//

import UIKit

class ModalViewController: UIViewController {
    
    let modalContainerView = ModalContainerView()
    let titleLabel = TitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = BodyLabel(textAlignment: .center)
    let actionButton = ActionButton(color: .systemCyan, title: "Ok", systemImageName: "checkmark.circle")
    
    let padding: CGFloat = 20
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        view.addSubviews(modalContainerView, titleLabel, actionButton, messageLabel)
        
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        NSLayoutConstraint.activate([
            modalContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalContainerView.widthAnchor.constraint(equalToConstant: 340),
            modalContainerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel() {
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: modalContainerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: modalContainerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: modalContainerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }

    func configureActionButton() {
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: modalContainerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: modalContainerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: modalContainerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageLabel() {
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: modalContainerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: modalContainerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
}
