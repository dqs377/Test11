//
//  AddFoodViewController.swift
//  OrderMenu
//
//  Created by  on 2018/7/18.
//  Copyright © 2018年 . All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController ,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var foodImageView: UIImageView!

    
    var food:Food?
    var steaks:Array<String> = Array<String>.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.descriptionTextField.layer.borderWidth = 0.5
        self.descriptionTextField.layer.cornerRadius = 3
        
        self.nameTextField.text = food?.name
       
       
        self.descriptionTextField.text = food?.fooddescription
        if let editFood = food {
            
        }
        

       
        if let foodS = food {
            self.foodImageView.image = UIImage.init(data: ((foodS.image))!)
            
            let sumPrice:Double = (food?.price as! NSString).doubleValue
            
            let foodSumPrice:String =  String(format: "%.2f", sumPrice)
            
            
            self.priceTextField.text = foodSumPrice
        }
       
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.steaks)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func optionPush(_ sender: Any) {
      
        
      
      
        
        
    }
    @IBAction func uploadClick(_ sender: Any) {
//        let imagePickerVC = TZImagePickerController.init(maxImagesCount: 1, delegate: self as TZImagePickerControllerDelegate)
//        imagePickerVC?.didFinishPickingPhotosHandle = { photos,assets, isSelectOriginalPhoto   in
//        self.foodImageView.image = photos?[0];
//
//
//
//        }
//
//        self.present(imagePickerVC!, animated: true) {
//
//        }
        
        let actionSheet:UIActionSheet = UIActionSheet.init(title: "选择资源", delegate: self, cancelButtonTitle: "取消",destructiveButtonTitle: nil, otherButtonTitles: "拍摄照片","选择相册")
       actionSheet.show(in: self.view)
     
        
    }
    @IBAction func saveBtnClick(_ sender: Any) {
        if (self.nameTextField.text?.isEmpty)! {
            
            return;
        }
        if (self.priceTextField.text?.isEmpty)! {
            return;
        }
      
        if (self.descriptionTextField.text?.isEmpty)! {
            
            return;
        }
        if (self.foodImageView.image == nil) {
           
            return;
        }
       
        let price:Double = (self.priceTextField.text as! NSString).doubleValue
       
        if (price <= 0) {
            
            return;
        }
        
        if let editFood = food {
            
       editFood.name =  self.nameTextField.text!
       editFood.price = self.priceTextField.text!
       editFood.fooddescription = self.descriptionTextField.text!
            editFood.image = self.foodImageView.image!.pngData()
     
            
        }else
        {
           
        }
   
        
      
       self.navigationController?.popViewController(animated: true)

    }
    
    
    public func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int)
    {
        if buttonIndex == 1 {
            let imagePickerController:UIImagePickerController = UIImagePickerController.init()
            imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePickerController.isEditing = true
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }else if buttonIndex == 2
        {
            let imagePickerController:UIImagePickerController = UIImagePickerController.init()
            imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePickerController.isEditing = true
           imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let chosenImage =  info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: true) {
                 self.foodImageView.image = image
            }
            //处理传入后台
        }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
