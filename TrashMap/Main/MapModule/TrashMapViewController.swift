//
//  TrashMapViewController.swift
//  TrashMap
//
//  Created by Павел Кай on 27.04.2023.
//

import UIKit
import MapKit

class TrashMapViewController: UIViewController {
    
    lazy var trashMap: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.setDefaultRegion()
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(trashMap)
        
        setConstraints()
    }
    


}

extension TrashMapViewController {
    
    func setConstraints() {
        trashMap.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.bottomMargin.equalToSuperview()
        }
    }
    
}
