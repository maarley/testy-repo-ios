//
//  ViewController.swift
//  photoapp
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

class ViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    var imagePickerController: UIImagePickerController!
    
    
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TakePhoto(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func SavePhoto(_ sender: Any) {
        SavePhoto(ImageName: "test.png")
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //code
        imagePickerController.dismiss(animated: true, completion: nil)
        myImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    func SavePhoto(ImageName: String ) {
        guard let image = myImageView.image
            else{
                return
        }
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]as NSString).appendingPathComponent(ImageName)
        
        //let image = myImageView.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
        
        
        
        
        
    }
}
