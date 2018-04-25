//
//  PokemonShowVC.swift
//  Pokemon
//
//  Created by Uldis on 24/04/2018.
//  Copyright © 2018 Uldis. All rights reserved.
//

import UIKit

class PokemonShowVC: UIViewController {

    @IBOutlet weak var pokemonImageView: UIImageView!
    
    var pokemon: Pokemon?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageUrl ?? "", completion: { (image) in
                self.pokemonImageView.image = image
            })
        } else {
            print("Pokemon is nil!")
        }
    }

}
