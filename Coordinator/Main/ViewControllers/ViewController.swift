//
//  ViewController.swift
//  Coordinator
//
//  Created by Alexandru Stegaru on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Main Fucking Window"
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        createView3()
        
    }
    
    @objc func didTapClear() {
        self.coordinator?.goToSecond()
    }
    
    func createView3() {
        let mainStack = UIStackView()
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.clipsToBounds = true
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.alignment = .fill
        mainStack.spacing = 8
        
        
        // Priority
        let priority250 = UILayoutPriority(rawValue: 250)
        let priority251 = UILayoutPriority(rawValue: 251)
        let priority249 = UILayoutPriority(rawValue: 249)
        let priority48 = UILayoutPriority(rawValue: 48)
        let priority749 = UILayoutPriority(rawValue: 749)
        let priority750 = UILayoutPriority(rawValue: 750)
        
        // Get the first Stack width
        
        
        
        func createGenericLabelTextFieldStack(label: String, placeholder: String) -> UIStackView {
            let firstNameStackView = UIStackView()
            firstNameStackView.translatesAutoresizingMaskIntoConstraints = false
            firstNameStackView.clipsToBounds = true
            firstNameStackView.axis = .horizontal
            firstNameStackView.alignment = .firstBaseline
            firstNameStackView.distribution = .fill
            firstNameStackView.spacing = 8
            
            let firstNameLabel = UILabel()
            firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
            firstNameLabel.text = label
            firstNameLabel.textAlignment = .left
            firstNameLabel.setContentHuggingPriority(priority251, for: .horizontal)
            firstNameLabel.setContentHuggingPriority(priority251, for: .vertical)
            firstNameLabel.setContentCompressionResistancePriority(priority750, for: .horizontal)
            firstNameLabel.setContentCompressionResistancePriority(priority750, for: .vertical)
            
            let firstNameTextField = UITextField()
            firstNameTextField.borderStyle = .roundedRect
            firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
            firstNameTextField.placeholder = placeholder
//            firstNameTextField.layer.cornerRadius = 5
//            firstNameTextField.layer.borderWidth = 1
//            firstNameTextField.layer.borderColor = UIColor.gray.cgColor
            firstNameTextField.setContentHuggingPriority(priority48, for: .horizontal)
            firstNameTextField.setContentHuggingPriority(priority250, for: .vertical)
            firstNameTextField.setContentCompressionResistancePriority(priority749, for: .horizontal)
            firstNameTextField.setContentCompressionResistancePriority(priority750, for: .vertical)
            firstNameTextField.widthAnchor.constraint(equalToConstant: 175).isActive = true
//            firstNameTextField.backgroundColor = .red
            firstNameStackView.addArrangedSubview(firstNameLabel)
            firstNameStackView.addArrangedSubview(firstNameTextField)
            
            
            return firstNameStackView
        }
        

        
        let firstNameStack = createGenericLabelTextFieldStack(label: "First", placeholder: "Enter First Name")
        let middleNameStack = createGenericLabelTextFieldStack(label: "Middle", placeholder: "Enter Middle Name")
        let lastNameStack = createGenericLabelTextFieldStack(label: "Last", placeholder: "Enter Last Name")
        
        
        let nameStackView = UIStackView()
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.alignment = .fill
        nameStackView.axis = .vertical
        nameStackView.distribution = .fill
        nameStackView.spacing = 8
        nameStackView.addArrangedSubview(firstNameStack)
        nameStackView.addArrangedSubview(middleNameStack)
        nameStackView.addArrangedSubview(lastNameStack)

        
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "lock.icloud.fill")
        image.setContentHuggingPriority(priority250, for: .horizontal)
        image.setContentHuggingPriority(priority250, for: .vertical)
        image.setContentCompressionResistancePriority(priority48, for: .horizontal)
        image.setContentCompressionResistancePriority(priority48, for: .vertical)
        image.frame.size.width = image.frame.size.height
        
        let upperMostStack = UIStackView()
        upperMostStack.translatesAutoresizingMaskIntoConstraints = false
        upperMostStack.axis = .horizontal
        upperMostStack.alignment = .fill
        upperMostStack.distribution = .fill
        upperMostStack.spacing = 8
        
        upperMostStack.addArrangedSubview(image)
        upperMostStack.addArrangedSubview(nameStackView)
        
        let buttonsStackView = UIStackView()
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .firstBaseline
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 8
        
        let saveButton = UIButton(type: .system)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.layer.backgroundColor = UIColor.blue.cgColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.blue.cgColor
        saveButton.tintColor = .white
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        saveButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let cancelButton = UIButton(type: .system)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        
        let clearButton = UIButton(type: .system)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Clear", for: .normal)
        let clearTap = UITapGestureRecognizer(target: self, action: #selector(didTapClear))
        clearButton.addGestureRecognizer(clearTap)
        
        buttonsStackView.addArrangedSubview(saveButton)
        buttonsStackView.addArrangedSubview(cancelButton)
        buttonsStackView.addArrangedSubview(clearButton)
        
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .gray
        textView.setContentHuggingPriority(priority250, for: .horizontal)
        textView.setContentHuggingPriority(priority249, for: .vertical)
        textView.setContentCompressionResistancePriority(priority250, for: .horizontal)
        textView.setContentCompressionResistancePriority(priority250, for: .vertical)
        
        
        mainStack.addArrangedSubview(upperMostStack)
        mainStack.addArrangedSubview(textView)
        mainStack.addArrangedSubview(buttonsStackView)
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant:  -20),
        ])
        
    }
    
    func createView2() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        
        let label = UILabel()
        label.text = "Lock"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.backgroundColor = .blue
        label.textAlignment = .center

        
        var tosButton = UIButton()
        tosButton = UIButton(type: .system)
        tosButton.translatesAutoresizingMaskIntoConstraints = false
        tosButton.setTitle("Edit", for: .normal)
        tosButton.layer.cornerRadius = 5
        tosButton.layer.backgroundColor = UIColor.blue.cgColor
        tosButton.layer.borderWidth = 1
        tosButton.layer.borderColor = UIColor.blue.cgColor
        tosButton.tintColor = .white
        tosButton.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        tosButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tosButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        tosButton.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        let image = UIImageView()
        image.image = UIImage(systemName: "lock.icloud.fill")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.setContentHuggingPriority(.defaultLow, for: .horizontal)
        image.setContentHuggingPriority(.defaultLow, for: .vertical)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
    
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(tosButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant:  -20),
        ])
    }
    
    func createView1() {

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .blue
        view1.frame.size.height = 50
        view1.frame.size.width = 50
        view1.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        view1.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.addSubview(view1)
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .red
        view2.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
//        view2.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view2.setContentHuggingPriority(.defaultHigh, for: .vertical)
        view.addSubview(view2)
        
        let label = UILabel()
        label.text = """
The intrinsic content size acts as an input to Auto Layout. When a view has an intrinsic content size, the system generates constraints to represent that size and the constraints are used to calculate the layout.
        
        The fitting size, on the other hand, is an output from the Auto Layout engine. It is the size calculated for a view based on the view’s constraints. If the view lays out its subviews using Auto Layout, then the system may be able to calculate a fitting size for the view based on its content.

        The stack view is a good example. Barring any other constraints, the system calculates the stack view’s size based on its content and attributes. In many ways, the stack view acts as if it had an intrinsic content size: You can create a valid layout using only a single vertical and a single horizontal constraint to define its position. But its size is calculated by Auto Layout—it is not an input into Auto Layout. Setting the stack view’s CHCR priorities has no effect, because the stack view does not have an intrinsic content size.

        If you need to adjust the stack view’s fitting size relative to items outside the stack view, either create explicit constraints to capture those relationships or modify the CHCR priorities of the stack’s contents relative to the items outside the stack.

"""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        label.clipsToBounds = true
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
        
    }
}

