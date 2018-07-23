//
//  HomeDatasourceController+navbar.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 22/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    func setupNavigationBarItems(){
        setupRemainingNavItems()
        setupLeftNavItem()
        setuprightNavItems()
    }
    
    private func setuprightNavItems(){
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let compouseButton = UIButton(type: .system)
        compouseButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        compouseButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems  = [UIBarButtonItem(customView: compouseButton),UIBarButtonItem(customView: searchButton)]
    }
    
    private func setupLeftNavItem(){
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRemainingNavItems(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImageView
        
        // Poniendo la Barra de navegacion en blanco
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
    }
    
}
