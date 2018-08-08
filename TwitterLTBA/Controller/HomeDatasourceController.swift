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

    let errorMessageLabel: UILabel={
       let label = UILabel()
       label.text = "Apologies something were wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0 // Para que se muestre en dos líneas
        label.isHidden = true
        return label
    }()
    
//    Para que se transforme la vista al rotar el dispositivo, se manda a llamar 
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 232, g: 235, b: 241)
        setupNavigationBarItems()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA methods call, para acomodar con los anchor
        
        // Para llenar el DatasourceController
//        let homeDatasource = HomeDatasource()
//        self.datasource =  homeDatasource
        
//        El objeto singleton es cargado una sola vez y cuando termina la carga retorna el objeto 'homeDatasource'
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err { // _ si no se va usar la variable
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError>{
                    if apiError.response?.statusCode == 404 {
                        self.errorMessageLabel.text = "The service is not available!"
                    }
                    if apiError.response?.statusCode == 1 {
                        self.errorMessageLabel.text = "Internal server error!"
                    }
                }
            }
            self.datasource = homeDatasource
        }
//        ServiceSwift4.sharedInstace.fetchHomeFeed { (homeDatasource, err) in
//            DispatchQueue.main.sync(execute: {
//                if let _ = err { // _ si no se va usar la variable
//                      self.errorMessageLabel.isHidden = false
//                }
//                self.datasource = homeDatasource
//            })
//        }
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
            let estimatedFrame = NSString(string: user.bio).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
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
