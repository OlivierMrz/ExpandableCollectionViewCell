//
//  CollectionViewCell.swift
//  ExpandableCollectionCell
//
//  Created by Olivier Miserez on 20/02/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UIScrollViewDelegate, UITextViewDelegate {
    
    let exitButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("BACK", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.sizeToFit()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .yellow
        return sv
    }()
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let largeLabel : UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.sizeToFit()
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        scrollView.delegate = self
    }
    
    
    func setupView() {
        
        // add scrollView to contentView
        self.contentView.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        
        self.scrollView.addSubview(label)
        label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: (50 - (label.frame.height/2))).isActive = true
        label.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        
        self.contentView.addSubview(exitButton)
        exitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        exitButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        
        
        self.scrollView.addSubview(largeLabel)
        largeLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width)).isActive = true
        largeLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
        largeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        largeLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
