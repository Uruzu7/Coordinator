//
//  SecondScreenViewController.swift
//  Coordinator
//
//  Created by Alexandru Stegaru on 24.11.2021.
//

import UIKit

class SecondScreenViewController: UIViewController {
    var coordinator: SecondCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Second Fucking Window"
        
        setUpView()
    }
    

    func setUpView() {
        view = UIView()
        view.backgroundColor = .white
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints  = false
        textField.placeholder = "Add something here boye"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textField.setContentHuggingPriority(.defaultLow, for: .vertical)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        textField.clearButtonMode = .whileEditing

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.clipsToBounds = true
        scrollView.showsVerticalScrollIndicator = false
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints  = false
        label2.numberOfLines = 0
        label2.text = """
            When working with scroll views, you need to define both the size and position of the scroll view’s frame within its superview, and the size of the scroll view’s content area. All of these features can be set using Auto Layout.

            To support scroll views, the system interprets constraints differently, depending on where the constraints are located.

            Any constraints between the scroll view and objects outside the scroll view attach to the scroll view’s frame, just as with any other view.

            For constraints between the scroll view and its content, the behavior varies depending on the attributes being constrained:

            Constraints between the edges or margins of the scroll view and its content attach to the scroll view’s content area.

            Constraints between the height, width, or centers attach to the scroll view’s frame.

            You can also use constraints between the scroll view’s content and objects outside the scroll view to provide a fixed position for the scroll view’s content, making that content appear to float over the scroll view.

            For most common layout tasks, the logic becomes far easier if you use a dummy view or layout group to contain the scroll view’s content. When working in Interface Builder, the general approach is shown below:

            Add the scroll view to the scene.

            Draw constraints to define the scroll view’s size and position, as normal.

            Add a view to the scroll view. Set the view’s Xcode specific label to Content View.

            Pin the content view’s top, bottom, leading, and trailing edges to the scroll view’s corresponding edges. The content view now defines the scroll view’s content area.
            """
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .gray
        view2.addSubview(label2)
        
        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: view2.layoutMarginsGuide.leadingAnchor, constant: 8),
            label2.trailingAnchor.constraint(equalTo: view2.layoutMarginsGuide.trailingAnchor, constant: 8),
            label2.topAnchor.constraint(equalTo: view2.layoutMarginsGuide.topAnchor, constant: 8),
            label2.bottomAnchor.constraint(equalTo: view2.layoutMarginsGuide.bottomAnchor, constant: 8)
        ])
        
        scrollView.addSubview(view2)
        
        view.addSubview(textField)
        view.addSubview(label)
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            label.lastBaselineAnchor.constraint(equalTo: textField.lastBaselineAnchor),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            view2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            view2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            view2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
    }

}
