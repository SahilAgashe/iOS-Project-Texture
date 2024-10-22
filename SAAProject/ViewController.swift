//
//  ViewController.swift
//  SAAProject
//
//  Created by SAHIL AMRUT AGASHE on 24/08/24.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController {

    private lazy var myButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Press Me", for: .normal)
        btn.addTarget(self, action: #selector(pressMeAction), for: .touchUpInside)
        return btn
    }()
    
    private lazy var lat = Double(21.3808)
    private lazy var long = Double(79.7456)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let lbl = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 300))
//        lbl.font = .systemFont(ofSize: 10)
//        lbl.center = view.center
//        lbl.numberOfLines = 0
//        view.addSubview(lbl)
//        
//        lbl.text = "Hello SAhil Agashe slkdfksdfjsldfjksd fs slfksdfsd flsdkfksdf df"
//        print(lbl.calculateMaxLines(), calculateMaxLines(font: .systemFont(ofSize: 10), text: ""))
        
        let stack = UIStackView(arrangedSubviews: [myButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    @objc func pressMeAction() {
        let mapLocationStr = "https://www.google.com/maps/search/?api=1&query=\(lat),\(long)"
        let str = "telprompt://9307884749"
        let str2 = "dialer-app?phone=9307884749, dialer-app?phone=9307884749"
        let url = URL(string: mapLocationStr)!
        if UIApplication.shared.canOpenURL(url) {
            print("Can open url")
            UIApplication.shared.open(url) { flag in
                
            }
        }
    }

    func calculateMaxLines(font: UIFont = .systemFont(ofSize: 10) , text: String) -> Int {
        //let lbl = UILabel()
        //lbl.width = 100
        let maxSize = CGSize(width: 100, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = "Hello SAhil Agashe slkdfksdfjsldfjksd fs slfksdfsd flsdkfksdf df"
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
