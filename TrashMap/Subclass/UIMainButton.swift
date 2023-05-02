//
//  UIMainButton.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit

final class UIMainButton: UIButton {

    init(title: String, color: UIColor) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        
        backgroundColor = color
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
