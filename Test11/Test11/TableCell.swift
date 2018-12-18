//
//  TableCell.swift
//  OrderMenu
//
//  Created by  on 2018/7/19.
//  Copyright © 2018年 . All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak internal var foodImage: UIImageView!
    var _table:Food?
    var table: Food? {
        get {
            return _table
        }
        set {
            _table = newValue
            
            nameLab.text = _table?.name
           
        }
    }
    
    
    var deleteBlock:((_ model:Food)->())?
    var editBlock:((_ model:Food)->())?
    
    @IBAction func editClick(_ sender: Any) {
        editBlock?(self.table!)
        
        
    }
    @IBAction func deleteClick(_ sender: Any) {
        deleteBlock?(self.table!)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
