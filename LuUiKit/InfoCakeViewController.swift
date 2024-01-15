//
//  InfoCakeViewController.swift
//  LuUiKit
//
//  Created by VN Savis on 08/01/2024.
//

import UIKit

class InfoCakeViewController: UIViewController {
    
    @IBOutlet weak var labelDetalView: UIView!
    @IBOutlet weak var labelDetal: UILabel!
    @IBOutlet weak var heightDesDetalInfo: NSLayoutConstraint!

    @IBOutlet weak var imageCake: UIImageView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var heightDetalView: NSLayoutConstraint!
    @IBOutlet weak var desDetalTextView: UITextView!
    @IBOutlet weak var backView: UIView!
    
    var isHidern : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapBackView = UITapGestureRecognizer(target: self, action: #selector(onBack))
        
        let tapLabelDetal = UITapGestureRecognizer(target: self, action: #selector(onTapLabelDetail))
        
        self.backView.addGestureRecognizer(tapBackView)
        self.labelDetalView.addGestureRecognizer(tapLabelDetal)
        self.imageCake.backgroundColor = UIColor(hexString: "FFE5E5")
        self.desDetalTextView.textContainer.lineFragmentPadding = 0
        
        let imageURLString = "https://anhdephd.vn/wp-content/uploads/2022/03/hinh-anh-anime-nam-ngau.jpg"
        
        if let imageURL = URL(string: imageURLString) {
            let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageCake.image = UIImage(data: data)
                    }
                    
                } else if let error = error {
                    print("Lỗi khi tải dữ liệu hình ảnh: \(error.localizedDescription)")
                }
            }
            task.resume()
        } else {
            print("Đường link hình ảnh không hợp lệ.")
        }
    }
    
    @IBAction func onAddToBag(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "bagViewController") as! BagViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onBack () {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapLabelDetail () {
        self.isHidern = !self.isHidern
        let optimalSize = self.desDetalTextView.sizeThatFits(CGSize(width: self.desDetalTextView.frame.width, height: CGFloat.greatestFiniteMagnitude))
        UIView.animate(withDuration: 0.5) {
            if self.isHidern {
                // Set new height constraint constant
                self.heightDesDetalInfo.constant = self.desDetalTextView.frame.height - optimalSize.height
                self.heightDetalView.constant = self.detailView.frame.height - optimalSize.height
     
            } else {
             
                self.heightDesDetalInfo.constant = self.desDetalTextView.frame.height + optimalSize.height
                self.heightDetalView.constant = self.detailView.frame.height + optimalSize.height
            }
            // Force layout update
            self.view.layoutIfNeeded()
        }
    }

}
