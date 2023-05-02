//
//  UIMediaView.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit
import SnapKit

final class UIMediaView: UIView {
    
    typealias Callback = (() -> ())
    
    var onTap: Callback?
    
    lazy var backgroundMediaView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var addMediaButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapAddBtn), for: .touchUpInside)
        return btn
    }()
    
    init(mediaIcon: UIImage) {
        super.init(frame: .zero)
        
        addMediaButton.setImage(mediaIcon, for: .normal)
        
        layer.cornerRadius = 15
        
        addSubview(backgroundMediaView)
        backgroundMediaView.addSubview(addMediaButton)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapAddBtn() {
        onTap?()
    }
    
    func setMediaImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        backgroundMediaView.addSubview(imageView)
        addMediaButton.isHidden = true
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}

extension UIMediaView {
    
    func setConstraints() {
        backgroundMediaView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        addMediaButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
