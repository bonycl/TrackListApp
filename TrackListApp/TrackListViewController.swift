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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
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
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    //определение индекса вручную для передачи на след вью
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.trackName = trackList[indexPath.row]
            
        }
    }
    
}
