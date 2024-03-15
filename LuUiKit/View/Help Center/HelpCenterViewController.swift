//
//  HelpCenterViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 26/02/2024.
//

import UIKit
import RxSwift
import SnapKit

class HelpCenterViewController: UIViewController {
    
    var appbarView: UIView = {
        let view  = UIView()
        return view
    }()
    
    var backView: UIView = {
        let view  = UIView()
        view.backgroundColor = UIColor.white
        view.NGS_cornerRadius = 8
        view.frame.size = CGSize(width: 34, height: 34)
        view.setShadow()
        return view
    }()
    
    var titleAppbar: UILabel = {
        let view = UILabel()
        view.text = "Help"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.numberOfLines = 1
        view.textColor = UIColor(hexString: "174C4F")
        return view
    }()
    
    var imgBack: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Back")
        return view
    }()
    
//    var scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.showsVerticalScrollIndicator = false
//        return view
//    }()
    
//    let contentView = UIView()
//    
//    var uiview1: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.green
//        return view
//    }()
//    
//    var uiview2: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.red
//        return view
//    }()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        self.view.backgroundColor = UIColor(hexString: "FFF6F2")
        setUpUIAppBar()
        setUpUIBody()
        setUpOnTapView()
    }
    
    func setUpUIAppBar(){
        self.view.addSubview(appbarView)
        appbarView.snp.makeConstraints{
            $0.left.equalToSuperview().inset(24)
            $0.height.equalTo(35)
            $0.right.equalToSuperview().inset(24)
            $0.top.equalToSuperview().inset(60)
        }
        
        self.appbarView.addSubview(backView)
        backView.snp.makeConstraints {
            $0.left.equalTo(appbarView)
            $0.top.equalTo(appbarView)
            $0.width.equalTo(34)
            $0.height.equalTo(34)
            $0.bottom.equalTo(appbarView).inset(1)
        }
        
        self.backView.addSubview(imgBack)
        imgBack.snp.makeConstraints {
            $0.centerX.equalTo(backView)
            $0.centerY.equalTo(backView)
        }
        
        self.appbarView.addSubview(titleAppbar)
        titleAppbar.snp.makeConstraints {
            $0.left.equalTo(backView.snp.right)
            $0.right.equalTo(appbarView).inset(34)
            $0.top.equalTo(appbarView)
            $0.bottom.equalTo(appbarView).inset(1)
        }
        
    }
    
    func setUpUIBody(){
//        self.view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
//            $0.left.right.bottom.equalToSuperview().inset(24)
//            $0.top.equalTo(appbarView.snp.bottom).offset(24)
//        }
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            $0.width.equalTo(scrollView.snp.width)
//        }
//
//        contentView.addSubview(uiview1)
//        uiview1.snp.makeConstraints {
//            $0.left.right.equalTo(contentView)
//            $0.top.equalTo(contentView)
//            $0.height.equalTo(500)
//        }
//
//        contentView.addSubview(uiview2)
//        uiview2.snp.makeConstraints {
//            $0.left.right.equalTo(contentView)
//            $0.top.equalTo(uiview1.snp.bottom)
//            $0.height.equalTo(500)
//            $0.bottom.equalTo(contentView)
//        }
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HelpCell.self, forCellReuseIdentifier: "CellHelp")
        tableView.isScrollEnabled = false
        
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview().inset(24)
            $0.top.equalTo(appbarView.snp.bottom).offset(24)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setUpOnTapView(){
        let tapBack = UITapGestureRecognizer(target: self, action: #selector(onBack))
        self.backView.addGestureRecognizer(tapBack)
    }
    
    @objc func onBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension HelpCenterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellHelp", for: indexPath) as! HelpCell
                cell.textLabel?.text = "Row \(indexPath.row)"
                return cell
    }
    
}

class HelpCell: UITableViewCell {
    let titleLabel = UILabel()
    var view1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            contentView.addSubview(titleLabel)
            
            titleLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.centerY.equalToSuperview()
            }
            
            contentView.addSubview(view1)
            view1.snp.makeConstraints {
                
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().offset(-16)
                $0.height.equalTo(10)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

//class HelpCenterViewController: UIViewController {
//    let baseView = BaseViewModel()
//    let disposeBag = DisposeBag()
//
//    @IBOutlet weak var textHelp: UITextView!
//    @IBOutlet weak var backView: UIView!
//
//    var scrollView: UIScrollView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpOntapView()
//        baseView.getToken()
//        baseView.listCakeDonut
//            .observe(on: MainScheduler.instance)
//            .subscribe(onNext: { [weak self] newValue in
//                self?.textHelp.text = newValue?.accessToken ?? ""
//                print("New value received: \(newValue?.accessToken ?? "")")
//            })
//            .disposed(by: disposeBag)
//    }
//
//    func setUpUI(){
//
//        self.view.addSubview(scrollView)
//
//        scrollView.snp.makeConstraints {
//
//            $0.top.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
//
//        }
//
//    }
//
//    func setUpOntapView(){
//        let tapBack = UITapGestureRecognizer(target: self, action: #selector(onBack))
//        self.backView.addGestureRecognizer(tapBack)
//    }
//
//    @objc func onBack() {
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
//}
