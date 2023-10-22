//
//  FirstTableViewCell.swift
//  UITableViewChallenge02
//
//  Created by Samuel Montagnini on 22/10/23.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    //Creating a identifier based on class name
    static var identifier: String = "FirstTableViewCell"
    
    //referencing XIB file.
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configContactImageView()
        configContentView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        //Changing cell backgroundColor if it is selected or not.
        if selected == true {
            contentView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.3)
        } else {
            contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        }
    }
    //Function to setup the cell elements
    func setupCell(contact: Contact) {
        contactImageView.image = contact.contactImage
        nameLabel.text = contact.contactName
        ageLabel.text = "Age: \(String(contact.contactAge))"
        heightLabel.text = "Height: \(String(contact.contactHeight))"
        messageLabel.text = contact.contactMessage
        
    }
    
    func configContactImageView() {
        contactImageView.layer.masksToBounds = true
        contactImageView.layer.cornerRadius = contactImageView.frame.height / 2
        contactImageView.contentMode = .scaleAspectFill
    }
    
    func configContentView() {
        contentView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
    }
    
}


