//
//  ViewController.swift
//  UITableViewChallenge02
//
//  Created by Samuel Montagnini on 22/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactsTableView: UITableView!
    
    //Array to insert all contacts datas.
    var contacts: [Contact] = [Contact(contactName: "João Silva", contactImage: UIImage(named: "person01") ?? UIImage(), contactAge: 22, contactHeight: 1.75, contactMessage: "Hey man, what's up?"),Contact(contactName: "Caio Nogueira", contactImage: UIImage(named: "person02") ?? UIImage(), contactAge: 27, contactHeight: 1.82, contactMessage: "Could you help me with my work, please?"), Contact(contactName: "Anna Beatriz", contactImage: UIImage(named: "person03") ?? UIImage(), contactAge: 24, contactHeight: 1.62, contactMessage: "I have some news ;)"),Contact(contactName: "Rodrigo Bello", contactImage: UIImage(named: "person04") ?? UIImage(), contactAge: 32, contactHeight: 1.78, contactMessage: "Let's party saturday?"),Contact(contactName: "Bill Gates", contactImage: UIImage(named: "person05") ?? UIImage(), contactAge: 52, contactHeight: 1.92, contactMessage: "Nice app man, great job!")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configContactsTableView()
    }
    
    //Function to customize our tableview
    func configContactsTableView() {
        //Sign the protocols to ViewController
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        //Registering the cell in TableView.
        contactsTableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.identifier)
        contactsTableView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
    }

    
}
//Extension to separate the TableView protocols methods.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Rows based in aray index.
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Instantiating our cell and using in tableview.
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell
        //passing values to setupCell function and using in FirstTableViewCell file.
        cell?.setupCell(contact: contacts[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Height based in XIB original height.
        return 104
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Giving the section a string value.
        "Contacts"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Returning a popup message to user when it clicks on a contact cell. Popup shows the contact message.
        let alertController = UIAlertController(title: "Mesage", message: "Message: \(contacts[indexPath.row].contactMessage)", preferredStyle: .alert)
        //Creating an ok button to close popup.
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
        }
        //Adding ok button
        alertController.addAction(okAction)
        //Showing message on screen.
        self.present(alertController, animated: true, completion: nil)
    }
    
}
