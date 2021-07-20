//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by John Kent on 19.07.2021.
//

import UIKit

public class TimerViewController: UIViewController {
 
    @IBOutlet weak var saveTimer: UIButton!
    @IBOutlet weak var ChosenTime: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    
    public override func viewDidLoad() {
        self.view.layer.cornerRadius = 40
        self.view.layer.shadowOffset = CGSize.zero
        self.view.layer.shadowOpacity = 0.25
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowRadius = 8
        
        saveTimer.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        
        timerSlider.addTarget(self, action: #selector(didChangeOwnValue), for: .valueChanged)
        
        
        
        ChosenTime.text =  "\(timerSlider.value)"
    }
    
    @objc func didChangeOwnValue(){
        ChosenTime.text = NSString(format: "%.2f s", timerSlider.value) as String
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "app-timer"), object: ChosenTime)

    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension TimerViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
