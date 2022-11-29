//
//  ViewController.swift
//  tableView
//
//  Created by digital on 29/11/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HeaderViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["riri", "fifi", "loulou"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = HeaderView.makeInstanceFromNib()
        
        header.backgroundColor = UIColor.red
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: "second", for: indexPath)
        
        cell.textLabel?.text = self.data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        
        if indexPath.row == 1 {
            return 200
        }
        
        if indexPath.row == 2 {
            return 300
        }
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            for i in 0..<data.count{
                data[i] = "J'ai faim"
            }
            tableView.reloadData()
        }else{
            print(data[indexPath.row])
        }
    }
    
    func didStartEditing() {
        print("In did start editing from view controller")
        data = []
        //data = data.popFirst()
        
    }
}

