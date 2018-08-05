//
//  HomeDatasourceController.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 18/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


class HomeDatasourceController: DatasourceController {
    
//    Para que se transforme la vista al rotar el dispositivo, se manda a llamar 
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 235, b: 241)
        setupNavigationBarItems()
        
        // Para llenar el DatasourceController
//        let homeDatasource = HomeDatasource()
//        self.datasource =  homeDatasource
        
//        El objeto singleton es cargado una sola vez y cuando termina la carga retorna el objeto 'homeDatasource'
        Service.sharedInstance.fetchHomeFeed { (homeDatasource) in
            self.datasource = homeDatasource
        }
        
    }
    
    
//  Para quitar el espacio entre celdas
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Asigna el tamaño de la celda principal
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
//          print(user.bioText)
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000) // valor arbitrario
            let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)] // the same value of bioTextView
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 150)
    }
    
    // Asigna el tamaño de la celda header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (section == 1) {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    // Asigna el tamaño de la celda footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if (section == 1){
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
        
}
