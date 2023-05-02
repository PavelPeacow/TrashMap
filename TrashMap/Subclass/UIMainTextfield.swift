//
//  UIMainTextfield.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit

final class UIMainTextfield: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        setUpView(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(placeholder: String) {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        leftView = padding
        leftViewMode = .always
        rightView = padding
        rightViewMode = .always
        
        self.placeholder = placeholder
        backgroundColor = .systemGray6
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        textAlignment = .center
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.label.cgColor
    }
    
}
