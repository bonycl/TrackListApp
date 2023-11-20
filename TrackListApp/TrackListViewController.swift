//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by D i on 20.11.2023.
//

import UIKit

class TrackListViewController: UITableViewController {

    var trackList = [
        "Alberto Ruiz - 7 Elements (Original Mix)",
        "Dave Wincent - Red Eye (Original Mix)",
        "E-Spectro - End Station (Original Mix)",
        "Edna Ann - Phasma (Konstantin Yoodza Remix)",
        "Ilija Djokovic - Delusion (Original Mix)",
        "John Baptiste - Mycelium (Original Mix)",
        "Lane 8 - Fingerprint (Original Mix)",
        "Mac Vaughn - Pink Is My Favorite Color (Alex Stein Remix)",
        "Metodi Hristov, Gallya - Badmash (Original Mix)",
        "Veerus, Maxie Devine - Nightmare (Original Mix)"
    ]
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trackList.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackName", for: indexPath)
        
        if #available(iOS 14, *) {
            var content = cell.defaultContentConfiguration()
            content.text = trackList[indexPath.row]
            content.textProperties.numberOfLines = 0
            
            content.image = UIImage(named: trackList[indexPath.row])
            content.imageProperties.maximumSize = CGSize(width: 43, height: 43)
            cell.contentConfiguration = content
            
        } else {
            cell.textLabel?.text = trackList[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.imageView?.image = UIImage(named: trackList[indexPath.row])
            cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
            
            cell.imageView?.clipsToBounds = true
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.contentMode = .scaleAspectFit

        }
    
        return cell
    }
    
    //MARK: - Table View Delegate
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//  

}
