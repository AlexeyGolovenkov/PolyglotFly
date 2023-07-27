//
//  ViewController.swift
//  PolyglotFly
//
//  Created by Alexey Golovenkov on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {

    enum Language: String {
        case ru
        case en
        case de
    }
    
    @IBOutlet weak var russianButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var dutchButton: UIButton!
    
    var lang: Language = .en {
        didSet {
            fillButtons()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillButtons()
    }

    func fillButtons() {
        let bundlePath = Bundle.main.path(forResource: lang.rawValue, ofType: "lproj")
        let bundle = Bundle(path: bundlePath!)
        russianButton.setTitle(bundle!.localizedString(forKey: "RussianButton", value: "Russian button", table: nil), for: .normal)
        englishButton.setTitle(bundle!.localizedString(forKey: "EnglishButton", value: "English button title", table: nil), for: .normal)
        dutchButton.setTitle(bundle!.localizedString(forKey: "DutchButton", value: "Dutch button title", table: nil), for: .normal)
    }
    
    @IBAction func russianButtonTap(_ sender: Any) {
        lang = .ru
    }
    
    @IBAction func englishButtonPressed(_ sender: Any) {
        lang = .en
    }
    
    @IBAction func dutchButtonPressed(_ sender: Any) {
        lang = .de
    }
}

