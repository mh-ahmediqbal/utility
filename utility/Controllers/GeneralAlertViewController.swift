//
//  GeneralAlertViewController.swift
//  utility
//
//  Created by Ahmed Iqbal on 5/28/22.
//

import UIKit

class GeneralAlertViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonCross: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var imageViewAlertIcon: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    
    var button1ActionHandler : (() -> ())?
    var button2ActionHandler : (() -> ())?
    
    var dismissAlertOnbutton1Tap : Bool! = true
    var dismissAlertOnbutton2Tap : Bool! = true
    
    // Configurations properties
    var alertTitle : String!
    var alertDescription : String!
    
    var button1Title : String?
    var button2Title : String?
    
    var button1Configurations : GeneralAlertButtonConfigurations? = GeneralAlertButtonConfigurations(borderColor: UIConfiguration.ThemeDarkSeaGreen.cgColor, backgroundColor: UIConfiguration.WhiteColor, title: Constants.Cancel.uppercased(), titleColor: UIConfiguration.ThemeDarkSeaGreen)
    var button2Configurations : GeneralAlertButtonConfigurations? = GeneralAlertButtonConfigurations(title: Constants.OK.uppercased())
    
    var iconName: String?
    
    var isNormalAlertConfigurations : Bool = true
    
    var alertType : AlertType! = .Info
    
    var isbutton1Hidden = false
    var isbutton2Hidden = false
    
    var isCrossbuttonHidden = true
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
     
    }
    
    
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    // MARK: - Configure View
    fileprivate func configureView() {
        
        self.buttonCross.isHidden = isCrossbuttonHidden
        
        enableDisableButton1(isEnable: true)
        enableDisableButton2(isEnable: true)
        
        self.labelTitle.setupTextAppearance(font: UIConfiguration.getUIFONTAPPREGULAR(sizeFont: UIConfiguration.kFontSizeHeading4))
        self.labelDescription.setupTextAppearance(textColor: UIConfiguration.DarkGreyColor)
        self.mainView.setupGeneralButtonAppearance(cornerRaius: 2, backgroundColor: UIConfiguration.WhiteColor)
        
        self.labelTitle.text = alertTitle
        self.labelDescription.text = alertDescription
        
        if let button1Title = self.button1Title {
            button1Configurations?.title = button1Title
        }
        
        if let button2Title = self.button2Title {
            button2Configurations?.title = button2Title
        }
        
        button1Configurations?.isbuttonHidden = isbutton1Hidden
        button2Configurations?.isbuttonHidden = isbutton2Hidden
        self.configureButton1(alertButtonConfigurations: button1Configurations)
        self.configureButton2(alertButtonConfigurations: button2Configurations)
        
        self.configureAlertIcon(alertType: alertType, iconName: iconName)
    }
    
    // MARK: - Configure Button1
    func configureButton1(alertButtonConfigurations: GeneralAlertButtonConfigurations?) {
        
        guard let alertButtonConfigurations = alertButtonConfigurations else {
            return
        }
        
        self.button1.isHidden = alertButtonConfigurations.isbuttonHidden
        self.button1.setupGeneralButtonAppearance(cornerRaius: alertButtonConfigurations.cornerRaius, borderWidth: alertButtonConfigurations.borderWidth, borderColor: alertButtonConfigurations.borderColor, backgroundColor: alertButtonConfigurations.backgroundColor)
        
        self.button1.setTitle(alertButtonConfigurations.title, for: .normal)
        self.button1.setTitleColor(alertButtonConfigurations.titleColor, for: .normal)
        self.button1.tintColor = alertButtonConfigurations.titleColor
        self.button1.titleLabel?.font = alertButtonConfigurations.font
        // update dismissAlert on button tap properties
        self.dismissAlertOnbutton1Tap = alertButtonConfigurations.dismissAlertOnButtonTap
    }
    
    // MARK: - Configure Button2
    func configureButton2(alertButtonConfigurations: GeneralAlertButtonConfigurations?) {
        
        guard let alertButtonConfigurations = alertButtonConfigurations else {
            return
        }
        
        self.button2.isHidden = alertButtonConfigurations.isbuttonHidden
        self.button2.setupGeneralButtonAppearance(cornerRaius: alertButtonConfigurations.cornerRaius, borderWidth: alertButtonConfigurations.borderWidth, borderColor: alertButtonConfigurations.borderColor, backgroundColor: alertButtonConfigurations.backgroundColor)
        self.button2.setTitle(alertButtonConfigurations.title, for: .normal)
        self.button2.setTitleColor(alertButtonConfigurations.titleColor, for: .normal)
        self.button2.tintColor = alertButtonConfigurations.titleColor
        self.button2.titleLabel?.font = alertButtonConfigurations.font
        // update dismissAlert on button tap properties
        self.dismissAlertOnbutton2Tap = alertButtonConfigurations.dismissAlertOnButtonTap
    }
    
    //MARK: - Configure Alert icon
    fileprivate func configureAlertIcon(alertType: AlertType, iconName: String? = "") {
        
        if iconName != nil && iconName?.count ?? 0 > 0 {
            if let icon = UIImage(named: iconName!) {
                self.imageViewAlertIcon.image = icon
            }
        } else {
            switch alertType {
            case .Success:
                self.imageViewAlertIcon.image = UIImage(systemName: "")
            case .Failure:
                self.imageViewAlertIcon.image = UIImage(named: "ic_alert_warning")
            case .Warning:
                self.imageViewAlertIcon.image = UIImage(named: "ic_alert_warning")
            case .Caution:
                self.imageViewAlertIcon.image = UIImage(named: "ic_alert_warning")
            default:
                self.imageViewAlertIcon.image = UIImage(named: "ic_alert_success")
            }
        }
    }
    
    // MARK: - Enable/Disable Button1
    private func enableDisableButton1(isEnable: Bool) {
        
        self.button1.isUserInteractionEnabled = isEnable
    }
    
    // MARK: - Enable/Disable Button1
    private func enableDisableButton2(isEnable: Bool) {
        
        self.button2.isUserInteractionEnabled = isEnable
    }
    
    // MARK:- Show Alert
    func configureHBLGeneralAlert(title: String, description: String, alertType: AlertType, button1Title: String? = Constants.Cancel.uppercased(), button2Title: String? = Constants.OK.uppercased(), isCrossbuttonHidden: Bool = true, isbutton1Hidden: Bool = true, isbutton2Hidden: Bool = false, button1ActionHandler: (() -> ())? = nil, button2ActionHandler: (() -> ())? = nil) {
        
        self.alertTitle = title
        self.alertDescription = description
        
        self.button1Title = button1Title
        self.button2Title = button2Title
        
        self.button1ActionHandler = button1ActionHandler
        self.button2ActionHandler = button2ActionHandler
        
        self.alertType = alertType
        
        self.isbutton1Hidden = isbutton1Hidden
        self.isbutton2Hidden = isbutton2Hidden
        
        self.isCrossbuttonHidden = isCrossbuttonHidden
        
        self.isNormalAlertConfigurations = true
        
    }
    
    func configureHBLGeneralAlert(title: String, description: String, alertType: AlertType, isCrossbuttonHidden: Bool = true, iconName: String?, button1Configurations: GeneralAlertButtonConfigurations? = nil , button2Configurations: GeneralAlertButtonConfigurations? = nil, button1ActionHandler: (() -> ())? = nil, button2ActionHandler: (() -> ())? = nil) {
        
        self.alertTitle = title
        self.alertDescription = description
        
        self.button1ActionHandler = button1ActionHandler
        self.button2ActionHandler = button2ActionHandler
        
        self.button1Configurations = button1Configurations
        self.button2Configurations = button2Configurations
        
        self.alertType = alertType
        
        self.isCrossbuttonHidden = isCrossbuttonHidden
        
        self.isNormalAlertConfigurations = false
        
    }
    
    // MARK: - IBActions
    
    @IBAction func buttonCrossTapped(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        
        if dismissAlertOnbutton1Tap {
            self.dismiss(animated: true, completion: nil)
        }
        
        self.button1ActionHandler?()
    }
    
    @IBAction func button2Tapped(_ sender: UIButton) {
        
        if dismissAlertOnbutton2Tap {
            self.dismiss(animated: true, completion: nil)
        }
        
        self.button2ActionHandler?()
    }
}

struct GeneralAlertButtonConfigurations {
    var cornerRaius: CGFloat
    var borderWidth: CGFloat
    var borderColor: CGColor?
    var backgroundColor: UIColor?
    var title: String?
    var titleColor : UIColor?
    var font: UIFont?
    var dismissAlertOnButtonTap : Bool! = true
    var isbuttonHidden = false
    
    init(cornerRaius: CGFloat = 2, borderWidth: CGFloat = 1, borderColor: CGColor? = UIConfiguration.ThemeMediumSeaGreen.cgColor, backgroundColor: UIColor? = UIConfiguration.ThemeMediumSeaGreen, title: String?, titleColor : UIColor? = UIConfiguration.WhiteColor, font: UIFont? = UIConfiguration.getUIFONTAPPREGULAR(sizeFont: UIConfiguration.kFontSizeMedium), isbuttonHidden: Bool = false, dismissAlertOnButtonTap : Bool? = true) {
        
        self.isbuttonHidden = isbuttonHidden
        self.cornerRaius = cornerRaius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.title = title
        self.titleColor = titleColor
        self.font = font
        self.dismissAlertOnButtonTap = dismissAlertOnButtonTap
        
    }
}

enum AlertType : String {
    case Success = "Success"
    case Failure = "Failure"
    case Warning = "Warning"
    case Info    = "Info"
    case Caution = "Caution"
}
