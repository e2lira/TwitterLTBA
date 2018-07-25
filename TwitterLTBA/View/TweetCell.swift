//
//  TweetCell.swift
//  TwitterLTBA
//
//  Created by edgar elias gonzalez lira on 23/07/18.
//  Copyright © 2018 edgar elias gonzalez lira. All rights reserved.
//

import LBTAComponents

class TweetCell:  DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet{
            guard let tweet = datasourceItem as? Tweet else { return }
//            Para concatenar texto y agregarle formato
            let attributeText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
//            para adicionar un espacio pequeño entre el nombre y el usuario, string interpolacion
            let usernameString = " \(tweet.user.username)\n"
            attributeText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedStringKey.foregroundColor: UIColor.gray])) 
//            Para adicionar un tipo de espacio entre líneas
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributeText.string.count)
            attributeText.addAttributes([NSAttributedStringKey.paragraphStyle: paragraphStyle], range: range)
            
            attributeText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributeText
            
            
        }
    }
    
//    es im UITextView para modificar en conjunto el texto
    let messageTextView: UITextView={
       let tv = UITextView()
        tv.text = "Hola mundo"
        tv.backgroundColor = .white
        return tv
    }()
    
    let profileImageView: UIImageView={
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
