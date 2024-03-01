//
//  HelpCenterViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 26/02/2024.
//

import UIKit
import RxSwift

class HelpCenterViewController: UIViewController {
    let baseView = BaseViewModel()
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var textHelp: UITextView!
    @IBOutlet weak var backView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOntapView()
        baseView.getToken()
        baseView.listCakeDonut
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] newValue in
                self?.textHelp.text = newValue?.accessToken ?? ""
                print("New value received: \(newValue?.accessToken ?? "")")
            })
            .disposed(by: disposeBag)
    }
    
    func setUpOntapView(){
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
