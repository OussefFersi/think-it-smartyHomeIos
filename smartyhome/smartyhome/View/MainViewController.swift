//
//  MainViewController.swift
//  smartyhome
//
//  Created by Oussef Fersi on 18/3/2021.
//

import UIKit

class MainViewController: UIViewController {
     static let USER_NAME_KEY: String = "userName"
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    var alertController:UIAlertController?
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.textColor = MStyle.textColor
        welcomeMessageLabel.textColor = MStyle.grayColor
        userNameTextField.textColor = MStyle.grayColor
        continueButton.backgroundColor = MStyle.blueColor
        view.backgroundColor = MStyle.backgroundColor
        
    }

    @IBAction func goHomeAction(_ sender: Any) {
       
        if !userNameTextField.hasText {
            showInputAlert(title: "Attention", message: "You need to enter your name")
        }else if (!isValidName(name: userNameTextField.text!) || userNameTextField.text!.count < 2){
            showInputAlert(title: "Attention", message: "Please enter a real name")
        }else {
            UserDefaults.standard.setValue(userNameTextField.text, forKey: MainViewController.USER_NAME_KEY)
            goHome()
        }
    }
        
        func isValidName(name:String) -> Bool{
            do {
                    let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
                                if regex.firstMatch(in: name, options: [], range: NSMakeRange(0, name.count)) != nil {
                                    
                                    return false
                                }
                        
                            }
                            catch {
                                print("ERROR")
                            }
            
                        return true
        }
    
    func goHome(){
        let homeVC = HomeViewController()
        delegate.window?.rootViewController = homeVC
    }
    
    func showInputAlert(title:String, message:String){
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)

            
        alertController!.addAction(okAction)
        
        self.present(alertController!, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
            let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            let scanner = Scanner(string: hexString)
            if (hexString.hasPrefix("#")) {
                scanner.scanLocation = 1
            }
            var color: UInt32 = 0
            scanner.scanHexInt32(&color)
            let mask = 0x000000FF
            let r = Int(color >> 16) & mask
            let g = Int(color >> 8) & mask
            let b = Int(color) & mask
            let red   = CGFloat(r) / 255.0
            let green = CGFloat(g) / 255.0
            let blue  = CGFloat(b) / 255.0
            self.init(red:red, green:green, blue:blue, alpha:alpha)
        }
        func toHexString() -> String {
            var r:CGFloat = 0
            var g:CGFloat = 0
            var b:CGFloat = 0
            var a:CGFloat = 0
            getRed(&r, green: &g, blue: &b, alpha: &a)
            let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
            return String(format:"#%06x", rgb)
        }
}
