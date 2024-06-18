//
//  TableController.swift
//  FlashCardsApp
//
//  Created by Mark Hunnewell on 3/21/24.
//

import UIKit

class WordViewController : UIViewController {
    
    @IBOutlet weak var langSelect: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var plistPath: [String]?
    var engWords = [""]
    var frWords = [""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readPlist()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func readPlist() {
        if let infoPlistPath = Bundle.main.path(forResource: "WordList", ofType: "plist"),
           let dict = NSArray(contentsOfFile: infoPlistPath) as? [String] {
            plistPath = dict
        }
        
        var count = 0
        while count < plistPath!.count {
            engWords.append(plistPath![count])
            count += 1
            frWords.append(plistPath![count])
            count += 1
        }
        
        engWords.removeFirst()
        frWords.removeFirst()
    }
    
    @IBAction func refreshTable(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    
}

extension WordViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plistPath!.count / 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if langSelect.selectedSegmentIndex == 0 {
            cell.textLabel?.text = engWords[indexPath.row]
        } else if langSelect.selectedSegmentIndex == 1 {
            cell.textLabel?.text = frWords[indexPath.row]
        }
        
        return cell
    }
    
}

extension WordViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let engWord = engWords[indexPath.row]
        let frWord = frWords[indexPath.row]
        
        let detailView = DetailViewController()
        detailView.engWrd = engWord
        detailView.frWrd = frWord
        detailView.selected = langSelect.selectedSegmentIndex
        
        
        present(detailView, animated: true)
    }
    
}
