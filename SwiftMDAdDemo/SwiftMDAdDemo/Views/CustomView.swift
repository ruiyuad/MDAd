//
//  CustomView.swift
//  SwiftMDAdDemo
//
//  Created by DerekYuYi on 2019/10/18.
//  Copyright © 2019 RuiYu. All rights reserved.
//

import UIKit

protocol UIViewLoading {}

extension UIViewLoading where Self: UIView {
    static func loadFromNib() -> Self {
        let nibName = "\(self)".split { $0 == "."}.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
}

// MARK: - CustomViewDelegate

protocol CustomViewDelegate: NSObjectProtocol {
    func adTapped()
}

extension CustomViewDelegate {
    func adTapped() {}
}


class CustomView: UIView, UIViewLoading {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var imageViewRatioConstraint: NSLayoutConstraint!
    
    weak var delegate: CustomViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(customAdTapped))
        addGestureRecognizer(tapGesture)
        
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.cornerRadius = 3.0
    }
    
    func update(_ imageUrlString: String?, title titleString: String?, desc descString: String?, imageRatio ratio: CGFloat) {
        
        imageViewRatioConstraint.constant = ratio
        
        if let imageUrlStr = imageUrlString,
            let url = URL(string: imageUrlStr) {
            DispatchQueue.main.async {
                do {
                    let data = try Data(contentsOf: url)
                    self.bgImageView.image = UIImage(data: data)
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }
        
        titleLabel.text = titleString
        detailsLabel.text = descString
    }
    
    @objc func customAdTapped(_ gesture: UITapGestureRecognizer) {
        delegate?.adTapped()
    }
}


