//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    let planetCellIdentifier = "PlanetCell"
    
    var planets = [Planet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generatePlanetInfo()
        
        navigationItem.title = "Planets"
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as? PlanetTableViewCell {
            
            var moons = ""
            
            if planets[indexPath.row].numberOfMoons == 1 {
                
                moons = "1 Moon"
                
            } else {
                
                moons = "\(planets[indexPath.row].numberOfMoons) Moons"
            }
            
            cell.planetNameLabel.text = planets[indexPath.row].name
            cell.numberOfMoonsLabel.text = moons
            cell.numberOfDaysFullOrbitLabel.text = "\(planets[indexPath.row].fullOrbit) days (full orbit)"
            cell.numberOfFacts.text = "\(planets[indexPath.row].facts.count) facts"
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destVC = segue.destination as? FactTableViewController {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                destVC.planet = planets[indexPath.row]
            }
        }
    }
    
    func generatePlanetInfo() {
        
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."])
        
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."])
        
        planets.append(earth)
        planets.append(mars)
    }
    
}
