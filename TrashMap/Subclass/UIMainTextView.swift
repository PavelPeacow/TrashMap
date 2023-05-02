//
//  UIMainTextView.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit
import SnapKit

final class UIMainTextView: UITextView {
    
    var placeholderText = "" {
        didSet {
            label.text = placeholderText
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .placeholderText
        return label
    }()
    
    init(placeholder: String) {
        super.init(frame: .zero, textContainer: nil)
        
        addSubview(label)
                
        setUpView(placeholder: placeholder)
        setConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeText), name: UITextView.textDidChangeNotification, object: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(placeholder: String) {
        backgroundColor = .systemGray6
        returnKeyType = .done
        autocorrectionType = .no
        autocapitalizationType = .none
        placeholderText = placeholder
        font = .systemFont(ofSize: 17)
        textContainerInset = .init(top: 10, left: 15, bottom: 10, right: 15)
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.label.cgColor
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.centerWithinMargins.equalToSuperview()
        }
    }
    
    @objc func didChangeText() {
        label.isHidden = !text.isEmpty
    }
    
}
