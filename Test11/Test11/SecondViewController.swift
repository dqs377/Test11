//
//  SecondViewController.swift
//  Test11
//
//  Created by fpm0259 on 2018/12/17.
//  Copyright © 2018年 fpm0259. All rights reserved.
//

import UIKit

protocol blockDelegate {
    func saveClick(_ model:Model);
}

class SecondViewController: UIViewController {

    var model:Model = Model();
    var delegate:blockDelegate?
    
    @IBOutlet weak var lab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lab.text = self.model.name;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.model.name = "张丹三";
        self.delegate?.saveClick(self.model);
        self.dismiss(animated: true, completion: nil);
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
