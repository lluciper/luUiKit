//
//  HomeViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    let baseView = BaseViewModel()
    let disposeBag = DisposeBag()
    var listImageCake: [String] = ["Location", "Location", "Location", "Location", "Location"]
    var listNameCake: [String] = ["Donut1", "Donut2", "Donut3", "Donut4", "Donut5"]
    var listPriceCake: [String] = ["$ 1.00", "$ 2.00", "$ 3.00", "$ 4.00", "$ 5.00"]
    var drink : [String] = ["aaaaa", "bbbbbb", "cccccc", "dddddd"]
    
    @IBOutlet weak var viewDropLocation: UIView!
    @IBOutlet weak var heightDropLocation: NSLayoutConstraint!
    @IBOutlet weak var viewChooseLocation: UIView!
    @IBOutlet weak var cakeCollectionView: UICollectionView!{
        didSet {
            cakeCollectionView.register(UINib(nibName: "CakeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CakeCollectionViewCell")
        }
    }
    
    @IBOutlet weak var drinkStackView: UIStackView!
    @IBOutlet weak var donutsView: UIView!
    @IBOutlet weak var icedDrinksView: UIView!
    @IBOutlet weak var hotDrinksView: UIView!
    
    @IBOutlet weak var donutsLabel: UILabel!
    @IBOutlet weak var icedDrinksLabel: UILabel!
    @IBOutlet weak var hotDrinksLabel: UILabel!
    
    @IBOutlet weak var cakeTableView: UITableView! {
        didSet {
            cakeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
            cakeTableView.dataSource = self
            cakeTableView.delegate = self
        }
    }
    
    func bindTableView(){
        cakeCollectionView.rx.setDelegate(self).disposed(by: disposeBag)
        baseView.listDataTest.bind(to: cakeCollectionView.rx.items(cellIdentifier: "CakeCollectionViewCell", cellType: CakeCollectionViewCell.self)){(row, item, cell) in
            let imageURLString = "https://i.pinimg.com/originals/42/6b/d9/426bd99833a838b008ca06582d4d5b5e.jpg"
            cell.imageCake.setImage(imageURLString)
            cell.imageCake.layer.cornerRadius = 8
            cell.imageCake.clipsToBounds = true
            cell.nameCake.text = "\(item.id ?? 0)"
            cell.priceCake.text = "\(item.id ?? 0)"
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.getDataTest()
        bindTableView()
        let tapShowDropDown = UITapGestureRecognizer(target: self, action: #selector(onShowDropDown))
        
        self.viewChooseLocation.addGestureRecognizer(tapShowDropDown)
        
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
    
    var isHidern: Bool = true
    
    @objc func onShowDropDown () {
        baseView.searchData2()
        
        self.isHidern = !self.isHidern
        if self.isHidern {
            self.viewDropLocation.layer.masksToBounds = false
            self.viewDropLocation.layer.cornerRadius = 20
            self.viewDropLocation.layer.shadowColor = UIColor.red.cgColor
            self.viewDropLocation.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.viewDropLocation.layer.shadowOpacity = 0
            self.viewDropLocation.layer.shadowRadius = 1
            self.viewDropLocation.layer.shadowPath = UIBezierPath(roundedRect: self.viewDropLocation.bounds, cornerRadius: self.viewDropLocation.layer.cornerRadius).cgPath
            self.viewDropLocation.layer.shouldRasterize = true
        }
        UIView.animate(withDuration: 0.5, animations: {
            if self.isHidern {
                self.heightDropLocation.constant = 0
            } else {
                self.heightDropLocation.constant = 200
            }
            self.view.layoutIfNeeded()
        }, completion: {_ in
            self.viewDropLocation.layer.masksToBounds = false
            self.viewDropLocation.layer.cornerRadius = 20
            self.viewDropLocation.layer.shadowColor = UIColor.red.cgColor
            self.viewDropLocation.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.viewDropLocation.layer.shadowOpacity = 0.1
            self.viewDropLocation.layer.shadowRadius = 1
            self.viewDropLocation.layer.shadowPath = UIBezierPath(roundedRect: self.viewDropLocation.bounds, cornerRadius: self.viewDropLocation.layer.cornerRadius).cgPath
            self.viewDropLocation.layer.shouldRasterize = true
        })
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        let imageURLString = "https://i.pinimg.com/originals/42/6b/d9/426bd99833a838b008ca06582d4d5b5e.jpg"
        cell.cakeImage.setImage(imageURLString)
        cell.cakeImage.layer.cornerRadius = 4
        cell.cakeImage.clipsToBounds = true
        cell.cakeImage.backgroundColor = UIColor(hexString: "FFE5E5")
        cell.cakeLabel.text = drink[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = InfoCakeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
