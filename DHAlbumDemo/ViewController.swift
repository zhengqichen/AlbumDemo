//
//  ViewController.swift
//  DHAlbumDemo
//
//  Created by 雷丹 on 2019/9/4.
//  Copyright © 2019 CZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView1:UIImageView!
    var imageView2:UIImageView!
    var imageView3:UIImageView!
    var imageView4:UIImageView!
    var images = [DHAlbumModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        imageView1 = UIImageView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        imageView1.image = UIImage.init(named: "e01")
        imageView1.isUserInteractionEnabled = true
        imageView1.contentMode = .scaleAspectFill
        imageView1.clipsToBounds = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(showAlbumImage(sender:)))
        imageView1.addGestureRecognizer(tap1)
        imageView1.tag = 1
        view.addSubview(imageView1)
        
        imageView2 = UIImageView(frame: CGRect(x: imageView1.frame.maxX+10, y: 100, width: 100, height: 100))
        imageView2.image = UIImage.init(named: "e02")
        imageView2.isUserInteractionEnabled = true
        imageView2.contentMode = .scaleAspectFill
        imageView2.clipsToBounds = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(showAlbumImage(sender:)))
        imageView2.addGestureRecognizer(tap2)
        imageView2.tag = 2
        view.addSubview(imageView2)
        
        imageView3 = UIImageView(frame: CGRect(x: 50, y: imageView2.frame.maxY+10, width: 100, height: 100))
        imageView3.image = UIImage.init(named: "e03")
        imageView3.isUserInteractionEnabled = true
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(showAlbumImage(sender:)))
        imageView3.addGestureRecognizer(tap3)
        imageView3.contentMode = .scaleAspectFill
        imageView3.clipsToBounds = true
        imageView3.tag = 3
        view.addSubview(imageView3)
        
        imageView4 = UIImageView(frame: CGRect(x: imageView3.frame.maxX+10, y: imageView3.frame.minY, width: 100, height: 100))
        imageView4.image = UIImage.init(named: "e04")
        imageView4.isUserInteractionEnabled = true
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(showAlbumImage(sender:)))
        imageView4.addGestureRecognizer(tap4)
        imageView4.contentMode = .scaleAspectFill
        imageView4.clipsToBounds = true
        imageView4.tag = 4
        view.addSubview(imageView4)
        
        let window = UIApplication.shared.delegate?.window
        let frame1 = imageView1.convert(imageView1.bounds, to: window!)
        let frame2 = imageView2.convert(imageView2.bounds, to: window!)
        let frame3 = imageView3.convert(imageView3.bounds, to: window!)
        let frame4 = imageView4.convert(imageView4.bounds, to: window!)
        let mode1 = DHAlbumModel(smallRect: frame1, smallImage: imageView1.image, bigImageNamed: "e01", bigImageView: nil)
        let mode2 = DHAlbumModel(smallRect: frame2, smallImage: imageView2.image, bigImageNamed: "e02", bigImageView: nil)
        let mode3 = DHAlbumModel(smallRect: frame3, smallImage: imageView3.image, bigImageNamed: "e03", bigImageView: nil)
        let mode4 = DHAlbumModel(smallRect: frame4, smallImage: imageView4.image, bigImageNamed: "e04", bigImageView: nil)
        images = [mode1,mode2,mode3,mode4]
    }
    
    @objc func showAlbumImage(sender:UIGestureRecognizer) {
        let vc = DHAlbumViewController()
        vc.currentIndex = sender.view!.tag-1
        vc.images = images
        vc.isNet = false
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false, completion: nil)
        
    }
    
}

