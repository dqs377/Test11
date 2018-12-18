//
//  TableListViewController.swift
//  OrderMenu
//
//  Created by  on 2018/7/19.
//  Copyright © 2018年 . All rights reserved.
//

import UIKit

class TableListViewController: UITableViewController {

    var datas:[Food] = [Food]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
     
       self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.datas.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "TableCell"
        let cell:TableCell = tableView.dequeueReusableCell(withIdentifier: identifier)! as! TableCell
        let table:Food = self.datas[indexPath.row]
        cell .table = table
         cell.selectionStyle = .none
        cell.editBlock = { food in
            
            let story:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)

            let addVC:AddFoodViewController = story.instantiateViewController(withIdentifier: "AddTableViewController") as! AddFoodViewController
            addVC.food = food
            self.navigationController?.pushViewController(addVC, animated: true)
            
            
        }
        cell.deleteBlock = { table in
            
            self.tableView.reloadData()

        }
        
        
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
