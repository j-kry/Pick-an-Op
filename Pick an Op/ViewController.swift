//
//  ViewController.swift
//  Pick an Op
//
//  Created by Justin Krysinski on 5/14/18.
//  Copyright © 2018 Justin Krysinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var attackerImg: UIImageView!
    @IBOutlet weak var defenderImg: UIImageView!
    @IBOutlet weak var attackerLbl: UILabel!
    @IBOutlet weak var defenderLbl: UILabel!
    @IBOutlet var attackCollection: Array<UIImageView>?
    @IBOutlet var defendCollection: Array<UIImageView>?
    
    var attackers: [UIImage] = []
    var defenders: [UIImage] = []
    var exclude: [Int] = []
    var attackerNum = 0
    var defenderNum = 0
    var attackerNames = ["Sledge", "Thatcher", "Ash", "Thermite", "Twitch", "Montagne", "Glaz", "Fuze", "Blitz", "IQ", "Buck", "Blackbeard", "Capitao", "Hibana", "Jackal", "Ying", "Zofia", "Dokkaebi", "Lion", "Finka", "Maverick"]
    var defenderNames = ["Smoke", "Mute", "Castle", "Pulse", "Doc", "Rook", "Kapkan", "Tachanka", "Jager", "Bandit", "Frost", "Valkyrie", "Caveira", "Echo", "Mira", "Lesion", "Ela", "Vigil", "Maestro", "Alibi", "Clash"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...20{
            attackers.append(UIImage.init(named: "\(index).png")!)
        }
        
        for index in 0...20 {
            defenders.append(UIImage.init(named: "\(index)-df.png")!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackerBtn(_ sender: UIButton) {
        
        attackerNum = Int(arc4random_uniform(21))
        attackerImg.image = attackers[attackerNum]
        attackerLbl.text = attackerNames[attackerNum]
        attackerLbl.isHidden = false
        
    }
    
    @IBAction func defenderBtn(_ sender: UIButton) {
        
        defenderNum = Int(arc4random_uniform(21))
        defenderImg.image = defenders[defenderNum]
        defenderLbl.text = defenderNames[defenderNum]
        defenderLbl.isHidden = false
        
    }
    
    @IBAction func atkTeamBtn(_ sender: UIButton) {
        
        for index in 0...4 {
            attackerNum = Int(arc4random_uniform(21))
            while(exclude.contains(attackerNum)) {
                attackerNum = Int(arc4random_uniform(21))
            }
            attackCollection![index].image = attackers[attackerNum]
            exclude.append(attackerNum)
        }
        exclude.removeAll()
        
    }
    
    @IBAction func dfTeamBtn(_ sender: UIButton) {
        
        for index in 0...4 {
            defenderNum = Int(arc4random_uniform(21))
            while(exclude.contains(defenderNum)) {
                defenderNum = Int(arc4random_uniform(21))
            }
            defendCollection![index].image = defenders[defenderNum]
            exclude.append(defenderNum)
        }
        exclude.removeAll()
        
    }
    
    
}

