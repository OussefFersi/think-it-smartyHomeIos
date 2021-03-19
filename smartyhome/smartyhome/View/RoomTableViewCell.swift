//
//  RoomTableViewCell.swift
//  smartyhome
//
//  Created by Oussef Fersi on 18/3/2021.

//

import UIKit

class RoomTableViewCell: UITableViewCell {
    static let identifier = "RoomTableViewCell"
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var roomViewModel: RoomViewModel!{
        didSet {
            nameLabel?.text = roomViewModel.name
            descriptionLabel?.text = roomViewModel.description
            imageV?.image = roomViewModel.image
        }
    }
  
    
    
}
@IBDesignable extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shadowOpacity: CGFloat {
        get { return CGFloat(layer.shadowOpacity) }
        set { layer.shadowOpacity = Float(newValue) }
    }

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            guard let cgColor = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    
}
