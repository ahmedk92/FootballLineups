//
//  ViewController.swift
//  FootballLineups
//
//  Created by Ahmed Khalaf on 9/13/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let lineups: Lineups
    init(lineups: Lineups) {
        self.lineups = lineups
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = View(lineups: lineups)
    }
}

class View: UIView {
    fileprivate lazy var fieldImage = UIImage(named: "field")!
    fileprivate lazy var fieldImageView: UIImageView = {
        let iv = UIImageView(image: fieldImage)
        addSubview(iv)
        return iv
    }()
    private func layoutFieldImageView() {
        fieldImageView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.width * (fieldImage.size.height / fieldImage.size.width))
    }
    
    private let lineups: Lineups
    
    init(lineups: Lineups) {
        self.lineups = lineups
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutFieldImageView()
    }
}

extension ViewController {
    func viewProperty<T>(_ keyPath: KeyPath<View, T>) -> T {
        return (view as! View)[keyPath: keyPath]
    }
}
