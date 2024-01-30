//
//  RewardsViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 30/01/2024.
//

import UIKit

class RewardsViewController: UIViewController {

    @IBOutlet weak var view11: UIView!
    
    let yourView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        yourView.frame = CGRect(x: 0, y: 0, width: 0, height: 20)
//        yourView.backgroundColor = UIColor.blue
//        view11.addSubview(yourView)
//        yourView.layer.cornerRadius = 10
//                // Gọi hàm thực hiện animation
//        performAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        yourView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        yourView.backgroundColor = UIColor.blue
        view11.addSubview(yourView)
        yourView.layer.cornerRadius = 10
                // Gọi hàm thực hiện animation
        performAnimation()
    }
    
    func performAnimation() {
            // Tạo một gradient layer
        UIView.animate(withDuration: 5.0, animations: {
                    // Thiết lập kích thước mới cho view
                    self.yourView.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
                }) { (finished) in
                    // Animation đã hoàn thành, bạn có thể thêm xử lý sau khi hoàn thành nếu cần
                }
        }

}
