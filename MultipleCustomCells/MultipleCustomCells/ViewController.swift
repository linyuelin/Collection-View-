//
//  ViewController.swift
//  MultipleCustomCells
//
//  Created by dreaMTank on 2024/01/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
   
    

    
    private let tableView : UITableView = {
       let table = UITableView()
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SimpleTableViewCell.self, forCellReuseIdentifier: SimpleTableViewCell.identifier)
        tableView.register(imageTableViewCell.nib(), forCellReuseIdentifier: imageTableViewCell.identifier)
        tableView.register(CodedTableViewCell.self, forCellReuseIdentifier: CodedTableViewCell.identfier)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: CodedTableViewCell.identfier, for: indexPath) as! CodedTableViewCell
            cell.configure()
            return cell
        }
        
        if indexPath.row < 10 {
            let cell = tableView.dequeueReusableCell(withIdentifier: imageTableViewCell.identifier, for: indexPath) as! imageTableViewCell
            cell.configure(with: "image1")
            return cell
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.identifier, for: indexPath) as! SimpleTableViewCell
        
        cell.textLabel?.text = "もう問題"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

