//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Никита Коголенок on 3.12.20.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    // MARK: - Variables
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15", "dog16", "dog17", "dog18", "dog19",]
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.dogImageView.image
        }
    }
    
    // MARK: - UICollectionViewDataSource
    // MARK: - Number of sections
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // MARK: - Number of itemsInSection
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image
        
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    // MARK: - Size for item at(Размеры)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1)
        let availabWidth = collectionView.frame.width - paddingWidth
        let widthItem = availabWidth / itemsPerRow
        return CGSize(width: widthItem, height: widthItem)
    }
    // MARK: - Inset for section at(отступы)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    // MARK: - Minimum line spacing for section at
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
    // MARK: - Minimum interitem spacing for section at
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
