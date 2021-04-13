//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Никита Коголенок on 3.12.20.
//

import UIKit

class PhotoViewController: UIViewController {
    // MARK: - Varaibles
    var image: UIImage?
    // MARK: - Outlet
    @IBOutlet weak var photoImageView: UIImageView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
    }
    // MARK: - Action
    @IBAction func shareAction(_ sender: Any) {
        let shareControlle = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareControlle.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("All good")
            }
        }
        present(shareControlle, animated: true, completion: nil)
    }
}
