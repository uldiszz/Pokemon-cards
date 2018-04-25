//
//  ViewController.swift
//  Pokemon
//
//  Created by Uldis on 24/04/2018.
//  Copyright © 2018 Uldis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            if let error = error {
                print("Error getting from url \(url.absoluteString), error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do {
                    let card = try JSONDecoder().decode(Card.self, from: data)
                    self.data = card.cards
                } catch {
                    print("Failed to decode pokemon from data. \(error). Data: \(data)")
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Data is nil!!!")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokemonShow",
            let showView = segue.destination as? PokemonShowVC,
            let row = tableView.indexPathForSelectedRow?.row {
            showView.pokemon = data[row]
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.row].name
        
        return cell
    }
}











