//
//  ViewController.swift
//  ChallengeFlags - B
//
//  Created by Luciene Ventura on 10/04/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let flags = try! fm.contentsOfDirectory(atPath: path)
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        for flag in flags {
            if flag.hasSuffix("png") {
                pictures.append(flag)
            }
        }
        print(pictures)
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedFlag = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
  

}
        




