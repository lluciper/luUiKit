//
//  HomeControllerViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 04/01/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cakeCollectionView: UICollectionView!
    var listImageCake: [String] = ["Location", "Location", "Location", "Location", "Location"]
    var listNameCake: [String] = ["Donut1", "Donut2", "Donut3", "Donut4", "Donut5"]
    var listPriceCake: [String] = ["$ 1.00", "$ 2.00", "$ 3.00", "$ 4.00", "$ 5.00"]
    
    @IBOutlet weak var drinkStackView: UIStackView!
    @IBOutlet weak var donutsView: UIView!
    @IBOutlet weak var icedDrinksView: UIView!
    @IBOutlet weak var hotDrinksView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cakeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        if let layout = cakeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        // setup layout
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNameCake.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cakeCell", for: indexPath) as! CakeCollectionViewCell
        let imageURLString = "https://anhdephd.vn/wp-content/uploads/2022/03/hinh-anh-anime-nam-ngau.jpg"
        
        if let imageURL = URL(string: imageURLString) {
            let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.imageCake.image = UIImage(data: data)
                    }
                    
                } else if let error = error {
                    print("Lỗi khi tải dữ liệu hình ảnh: \(error.localizedDescription)")
                }
            }
            task.resume()
        } else {
            print("Đường link hình ảnh không hợp lệ.")
        }
        cell.imageCake.layer.cornerRadius = 8
        cell.imageCake.clipsToBounds = true
        cell.nameCake.text = listNameCake[indexPath.row]
        cell.priceCake.text = listPriceCake[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 174, height: 234)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        print("\(listNameCake.count) == \(section)")
        
        if listNameCake.count == section - 1 {
            return UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 24)
        } else if section == 0 {
            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        }
        return UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
    }
    
}
