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
    
    var drink : [String] = ["aaaaa", "bbbbbb", "cccccc", "dddddd"]
    
    @IBOutlet weak var drinkStackView: UIStackView!
    @IBOutlet weak var donutsView: UIView!
    @IBOutlet weak var icedDrinksView: UIView!
    @IBOutlet weak var hotDrinksView: UIView!
    
    @IBOutlet weak var donutsLabel: UILabel!
    @IBOutlet weak var icedDrinksLabel: UILabel!
    @IBOutlet weak var hotDrinksLabel: UILabel!
    
    @IBOutlet weak var cakeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cakeCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        self.onChangeMenu(1)
        
        if let layout = cakeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        let tapHotDrinksView = UITapGestureRecognizer(target: self, action: #selector(onChooseHotDrinks(_:)))
        let tapIcedDrinksView = UITapGestureRecognizer(target: self, action: #selector(onChooseIcedDrinks(_:)))
        let tapDonutsView = UITapGestureRecognizer(target: self, action: #selector(onChooseDonutsDrinks(_:)))
        
        self.hotDrinksView.addGestureRecognizer(tapHotDrinksView)
        self.icedDrinksView.addGestureRecognizer(tapIcedDrinksView)
        self.donutsView.addGestureRecognizer(tapDonutsView)
    }
    
    @objc func onChooseHotDrinks (_ sender: UITapGestureRecognizer) {
        self.onChangeMenu(1)
        drink = ["aaaaa", "bbbbbb", "cccccc", "dddddd"]
        cakeTableView.reloadData()
    }
    
    @objc func onChooseIcedDrinks (_ sender: UITapGestureRecognizer) {
        self.onChangeMenu(2)
        drink = ["111111", "222222", "33333", "44444"]
        cakeTableView.reloadData()
    }
    
    @objc func onChooseDonutsDrinks (_ sender: UITapGestureRecognizer) {
        self.onChangeMenu(3)
        drink = ["!!!!!", "@@@@@", "######", "$$$$$"]
        cakeTableView.reloadData()
    }
    
    func onChangeMenu(_ forcus: Int){
        hotDrinksView.backgroundColor = 1 == forcus ? AppColor.origin : AppColor.white
        hotDrinksLabel.textColor = 1 == forcus ? AppColor.white : AppColor.green
        icedDrinksView.backgroundColor = 2 == forcus ? AppColor.origin : AppColor.white
        icedDrinksLabel.textColor = 2 == forcus ? AppColor.white : AppColor.green
        donutsView.backgroundColor = 3 == forcus ? AppColor.origin : AppColor.white
        donutsLabel.textColor = 3 == forcus ? AppColor.white : AppColor.green
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drink.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cakeTableCell", for: indexPath) as! CakeTableViewCell
        
        let imageURLString = "https://anhdephd.vn/wp-content/uploads/2022/03/hinh-anh-anime-nam-ngau.jpg"
        
        if let imageURL = URL(string: imageURLString) {
            let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.cakeImage.image = UIImage(data: data)
                    }
                    
                } else if let error = error {
                    print("Lỗi khi tải dữ liệu hình ảnh: \(error.localizedDescription)")
                }
            }
            task.resume()
        } else {
            print("Đường link hình ảnh không hợp lệ.")
        }
        
        cell.cakeImage.layer.cornerRadius = 4
        cell.cakeImage.clipsToBounds = true
        cell.cakeLabel.text = drink[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "infoCakeViewController") as! InfoCakeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
