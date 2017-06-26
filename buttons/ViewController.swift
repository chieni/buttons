//
//  ViewController.swift
//  buttons
//
//  Created by Isabel Chien on 6/22/17.
//  Copyright © 2017 Isabel Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var moreOffImg: UIImage! = {
        let img = UIImage(named: "more_off")!
        return img.withRenderingMode(.alwaysTemplate)
    }()
    
    var moreOnImg: UIImage! = {
        let img = UIImage(named: "more_on")!
        return img.withRenderingMode(.alwaysTemplate)
    }()
    
    var more: RoundButton!
    var b1: RoundButton!
    var b2: RoundButton!
    var b3: RoundButton!
    var btnModal: UIView!

    var b1Center: CGPoint!
    var b2Center: CGPoint!
    var b3Center: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centerPt: CGPoint = view.center
      
        view.backgroundColor = UIColor.white
        btnModal = UIView(frame: view.frame)
        btnModal.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        view.addSubview(btnModal)
        btnModal.alpha = 0

        
        
        more = RoundButton(frame: CGRect(x:0,y:0,width:50,height:50))
        more.cornerRadius = 25
        more.borderWidth = 5
        more.borderColor = UIColor.red
        more.setImage(moreOffImg, for: .normal)
        more.tintColor = UIColor.red
        more.center = centerPt
        
        b1 = RoundButton(frame: CGRect(x:0,y:0,width:50,height:50))
        b1.setTitle("1",for: .normal)
        b1.cornerRadius = 25
        b1.borderWidth = 5
        b1.borderColor = UIColor.red
        b1.center = CGPoint(x:centerPt.x - 50, y:centerPt.y  - 50)
        
        b2 = RoundButton(frame: CGRect(x:100,y:600,width:50,height:50))
        b2.cornerRadius = 25
        b2.borderWidth = 5
        b2.borderColor = UIColor.red
        b2.center = CGPoint(x:centerPt.x, y:centerPt.y - 100)
        
        b3 = RoundButton(frame: CGRect(x:150,y:800,width:50,height:50))
        b3.cornerRadius = 25
        b3.borderWidth = 5
        b3.borderColor = UIColor.red
        b3.center = CGPoint(x:centerPt.x + 50, y:centerPt.y - 50)
        
        more.addTarget(self, action: #selector(moreClicked), for: UIControlEvents.touchUpInside)

        b1.alpha = 0
        b2.alpha = 0
        b3.alpha = 0
        
        b1Center = b1.center
        b2Center = b2.center
        b3Center = b3.center
        
        
        
        b1.center = more.center
        b2.center = more.center
        b3.center = more.center
        
        
        self.view.addSubview(more)
        self.view.addSubview(b1)
        self.view.addSubview(b2)
        self.view.addSubview(b3)
        
        
    }


    func moreClicked(_ sender: UIButton) {
        if more.transform == CGAffineTransform(rotationAngle: 0) {
            // expand buttons
            UIView.animate(withDuration: 0.3, animations: {
                self.btnModal.alpha = 1
                self.b1.alpha = 1
                self.b2.alpha = 1
                self.b3.alpha = 1
                
                self.b1.center = self.b1Center
                self.b2.center = self.b2Center
                self.b3.center = self.b3Center
                
            })
        } else {
            // contract buttons
            UIView.animate(withDuration: 0.3, animations: {
                self.btnModal.alpha = 0
                self.b1.alpha = 0
                self.b2.alpha = 0
                self.b3.alpha = 0
                
                self.b1.center = self.more.center
                self.b2.center = self.more.center
                self.b3.center = self.more.center
            })
        }
        
        
        
        if sender.transform == CGAffineTransform(rotationAngle: 0) {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        } else {
            sender.transform = CGAffineTransform(rotationAngle: 0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

