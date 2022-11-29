//
//  FirstTableViewCell.swift
//  tableView
//
//  Created by digital on 29/11/2022.
//

import UIKit

protocol HeaderViewDelegate{
    func didStartEditing()
}

class HeaderView: UIView, UITextFieldDelegate {

    @IBOutlet weak var searchField: UITextField!
    var delegate:HeaderViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        searchField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        print("Begin edition")
        delegate?.didStartEditing()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return pressed")
        return true
    }
    
    static func makeInstanceFromNib() -> HeaderView
    {
        return UINib(nibName: "HeaderView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! HeaderView
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let curString = textField.text{
            print(curString + string)
        }
        return true
    }

}
