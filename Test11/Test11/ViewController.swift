//
//  ViewController.swift
//  Test11
//
//  Created by fpm0259 on 2018/12/17.
//  Copyright © 2018年 fpm0259. All rights reserved.
//

import UIKit

class ViewController: UIViewController,blockDelegate {
    func saveClick(_ model: Model) {
        self.lab.text = model.name;
    }
    

    @IBOutlet weak var lab: UILabel!
    var model:Model = Model();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.name = "name";
        self.lab.text = model.name;
        
    }

    @IBAction func goClick(_ sender: Any) {
        let board:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil);
        let vc:SecondViewController = board.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController;
        vc.model = model;
        vc.delegate = self;
        self.present(vc, animated: true, completion: nil);
       
        
        
        
        
        
        
    }
    
    
    @IBAction func goFoodListVC(_ sender: Any) {
        let board:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil);
        let vc:TableListViewController = board.instantiateViewController(withIdentifier: "TableListViewController") as! TableListViewController;
        self.present(vc, animated: true, completion: nil);
   
    }
    
}

