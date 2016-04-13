//
//  PhotoDetailedViewController.swift
//  Photos
//
//  Created by Nimarit Walia on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class PhotosDetailedViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var likes: UILabel?
    @IBOutlet var likeButton: UIButton?
    @IBOutlet var username: UILabel?
    @IBOutlet var date: UILabel?
    
    var myPhoto: Photo?
    
    override func viewDidLoad() {
        likeButton!.setImage(UIImage(named: "blank_heart.png"), forState: UIControlState.Normal)
        likeButton!.tag = 1
        
        let url = NSURL(string: myPhoto!.url)
        let photoData = NSData(contentsOfURL: url!)
        imageView.image = UIImage(data: photoData!)
        
        username!.text = myPhoto!.username
        likes!.text = String(myPhoto!.likes)
        
        likeButton!.addTarget(self, action: "likeAction", forControlEvents: .TouchUpInside)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        
        let myDate = NSDate(timeIntervalSince1970: Double(myPhoto!.date!)!)
        let dateString = formatter.stringFromDate(myDate)
        date!.text = dateString
    }
    
    func likeAction() {
        if (likeButton!.tag == 1) {
            likes!.text = String(Int(likes!.text!)! + 1)
            likeButton!.setImage(UIImage(named: "red_heart.png"), forState: UIControlState.Normal)
            likeButton!.tag = 0
            
        } else {
            likes!.text = String(Int(likes!.text!)! - 1)
            likeButton!.setImage(UIImage(named: "blank_heart.png"), forState: UIControlState.Normal)
            likeButton!.tag = 1
        }
    }
    
    
}
