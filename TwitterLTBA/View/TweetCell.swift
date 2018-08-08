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
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
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
        tv.backgroundColor = .clear
        return tv
    }()
    
    let profileImageView: CachedImageView={
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let replyButton: UIButton={
       let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    let retweetButton: UIButton={
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "retweet"), for: .normal)
        return button
    }()
    
    let likeButtom: UIButton={
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        return button
    }()
    
    let sendMessageButtom: UIButton={
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "send_message"), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        addSubview(replyButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//        LTBAComponents method call
//        replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        setupBottomButtons()
    }
    
    func setupBottomButtons(){
    
        let replyButtonContainerView = UIView()
//        replyButtonContainerView.backgroundColor = .red
        
        let retweetButtonContainerView = UIView()
//        retweetButtonContainerView.backgroundColor = .blue
        
        let likeButtomContainerView = UIView()
//        likeButtomContainerView.backgroundColor = .yellow
        
        let sendMessageContainerView = UIView()
//        sendMessageContainerView.backgroundColor = .purple
        
        let buttomStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtomContainerView, sendMessageContainerView])
        
        buttomStackView.axis = .horizontal
        buttomStackView.distribution = .fillEqually // fillEqully llena de color con el mismo tamaño
        
        addSubview(buttomStackView)
        
        buttomStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButtom)
        addSubview(sendMessageButtom)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButtom.anchor(likeButtomContainerView.topAnchor, left: likeButtomContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        sendMessageButtom.anchor(sendMessageContainerView.topAnchor, left: sendMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
    
}


