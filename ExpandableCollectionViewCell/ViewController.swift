//
//  ViewController.swift
//  ExpandableCollectionCell
//
//  Created by Olivier Miserez on 20/02/2019.
//  Copyright © 2019 Olivier Miserez. All rights reserved.
//

import UIKit

class FirstScreenController: UIViewController, UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    let collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        // add the CollectionView to view
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = .yellow
        cell.exitButton.isHidden = true
        cell.scrollView.isScrollEnabled = false
        cell.scrollView.isUserInteractionEnabled = false
        cell.label.text = "Cell \(indexPath[1])"
        cell.largeLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui nisi, suscipit nec nisl non, commodo porttitor lacus. Nam finibus at diam et porttitor. Vestibulum condimentum nisi non augue vulputate porta. Proin vitae congue purus. Fusce consectetur nisl vitae semper sodales. Aliquam posuere erat blandit, facilisis tellus at, ullamcorper tortor. Fusce convallis nibh et enim hendrerit volutpat. Morbi non placerat massa. Sed et rhoncus lorem, sit amet rhoncus purus. Cras egestas elit id iaculis sodales. Phasellus vitae dictum tellus. Donec et tortor sodales, condimentum ante a, convallis mauris. Aliquam quis elit risus. Aliquam in elit posuere, placerat purus id, fringilla ipsum. Vestibulum interdum nibh vitae magna maximus viverra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui nisi, suscipit nec nisl non, commodo porttitor lacus. Nam finibus at diam et porttitor. Vestibulum condimentum nisi non augue vulputate porta. Proin vitae congue purus. Fusce consectetur nisl vitae semper sodales. Aliquam posuere erat blandit, facilisis tellus at, ullamcorper tortor. Fusce convallis nibh et enim hendrerit volutpat. Morbi non placerat massa. Sed et rhoncus lorem, sit amet rhoncus purus. Cras egestas elit id iaculis sodales. Phasellus vitae dictum tellus. Donec et tortor sodales, condimentum ante a, convallis mauris. Aliquam quis elit risus. Aliquam in elit posuere, placerat purus id, fringilla ipsum. Vestibulum interdum nibh vitae magna maximus viverra. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui nisi, suscipit nec nisl non, commodo porttitor lacus. Nam finibus at diam et porttitor. Vestibulum condimentum nisi non augue vulputate porta. Proin vitae congue purus. Fusce consectetur nisl vitae semper sodales. Aliquam posuere erat blandit, facilisis tellus at, ullamcorper tortor. Fusce convallis nibh et enim hendrerit volutpat. Morbi non placerat massa. Sed et rhoncus lorem, sit amet rhoncus purus. Cras egestas elit id iaculis sodales. Phasellus vitae dictum tellus. Donec et tortor sodales, condimentum ante a, convallis mauris. Aliquam quis elit risus. Aliquam in elit posuere, placerat purus id, fringilla ipsum. Vestibulum interdum nibh vitae magna maximus viverra."
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        cell.superview?.bringSubviewToFront(cell)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
            collectionView.isScrollEnabled = false
            cell.scrollView.isUserInteractionEnabled = true
            cell.frame = collectionView.bounds
            cell.exitButton.isHidden = false
            cell.exitButton.addTarget(self, action: #selector(self.exitButton), for: .touchUpInside)
            cell.scrollView.isScrollEnabled = true
        }, completion: nil)
        
    }
    
    @IBAction func exitButton() {
        let indexPath = collectionView.indexPathsForSelectedItems!
        collectionView.isScrollEnabled = true
        collectionView.reloadItems(at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width - 40), height: 100)
    }
    
    
}

