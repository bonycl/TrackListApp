//
//  ViewController.swift
//  TrackListApp
//
//  Created by D i on 20.11.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

         
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //метод нужен для определения индекса (пути к) ячейки с какими то данными.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Cell index \(indexPath.row)"
        
        return cell
    }

}

