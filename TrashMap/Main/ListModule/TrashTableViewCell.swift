//
//  TrashTableViewCell.swift
//  TrashMap
//
//  Created by Павел Кай on 26.04.2023.
//

import UIKit

class TrashTableViewCell: UITableViewCell {
    
    static let identifier = "TrashTableViewCell"
    
    private lazy var trashTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trashImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(trashImage)
        contentView.addSubview(trashTitle)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(trashModel: TrashTableViewModel) {
        trashTitle.text = trashModel.trashTitle
        trashImage.image = trashModel.trashImage
    }
}

extension TrashTableViewCell {
    
    func setConstraints() {
        trashImage.snp.makeConstraints {
            $0.left.equalTo(contentView.snp.left).offset(5)
            $0.top.greaterThanOrEqualTo(contentView.snp.top).offset(5)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-5)
            $0.height.width.equalTo(100)
        }
        
        trashTitle.snp.makeConstraints {
            $0.left.equalTo(trashImage.snp.right).offset(5)
            $0.right.equalTo(contentView.snp.right).offset(5)
            $0.centerY.equalToSuperview()
        }
    }
    
}
