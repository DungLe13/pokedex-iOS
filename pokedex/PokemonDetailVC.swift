//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Dung Le on 9/29/17.
//  Copyright © 2017 Dung Le. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var currentEvolImg: UIImageView!
    @IBOutlet weak var nextEvolImage: UIImageView!
    
    @IBOutlet weak var evolLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = img
        currentEvolImg.image = img
        pokedexLabel.text = String(pokemon.pokedexId)

        // Do any additional setup after loading the view.
        pokemon.downloadPokemonDetail {
            
            // Task will execute once the network call is completed
            self.updateUI()
        }
    }
    
    func updateUI() {
        attackLabel.text = pokemon.attack
        defenseLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolId == "" {
            evolLabel.text = "No Further Evolutions"
            nextEvolImage.isHidden = true
        } else {
            nextEvolImage.isHidden = false
            nextEvolImage.image = UIImage(named: pokemon.nextEvolId)
            let str = "Next Evolution: \(pokemon.nextEvolName) - lvl \(pokemon.nextEvolLevel)"
            evolLabel.text = str
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    

}
