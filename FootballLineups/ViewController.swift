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
    private lazy var fieldImage = UIImage(named: "field")!
    private lazy var fieldImageView: UIImageView = {
        let iv = UIImageView(image: fieldImage)
        addSubview(iv)
        return iv
    }()
    private var fieldImageSizeScaleFactor: (x: CGFloat, y: CGFloat) = (1, 1)
    private func layoutFieldImageView() {
        fieldImageView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.width * (fieldImage.size.height / fieldImage.size.width))
        fieldImageSizeScaleFactor.x = fieldImageView.frame.width / fieldImage.size.width
        fieldImageSizeScaleFactor.y = fieldImageView.frame.height / fieldImage.size.height
    }
    
    private let lineups: Lineups
    
    init(lineups: Lineups) {
        self.lineups = lineups
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var homePins: [(view: UILabel, position: Position)] = {
        return lineups.lineups.home.formation.positions.map({
            let l = UILabel(frame: .zero)
            l.backgroundColor = .blue
            l.textColor = .white
            l.text = $0.key
            addSubview(l)
            return (l, $0.value)
        })
    }()
    private func layoutHomeTeam() {
        for pin in homePins {
            pin.view.sizeToFit()
            pin.view.center = CGPoint(x: pin.position.x * fieldImageSizeScaleFactor.x, y: pin.position.y * fieldImageSizeScaleFactor.y)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layoutFieldImageView()
        layoutHomeTeam()
    }
}

