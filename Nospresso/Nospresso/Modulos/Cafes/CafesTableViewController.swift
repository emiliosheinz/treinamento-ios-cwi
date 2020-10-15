//
//  Cafes.swift
//  Nospresso
//
//  Created by Emilio Heinzmann on 15/10/20.
//

import UIKit

class CafesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Seção \(section)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "CafeCell", for: inde)
        celula.textLabel?.text = "Indice \(indexPath.row)"
        
        return celula 
    }
}
