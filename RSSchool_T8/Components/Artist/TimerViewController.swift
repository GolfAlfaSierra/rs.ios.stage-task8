//
//  TimerViewController.swift
//  RSSchool_T8
//
//  Created by John Kent on 19.07.2021.
//

import UIKit

public class TimerViewController: UIViewController {
 
}

extension TimerViewController: UIViewControllerTransitioningDelegate {
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return HalfPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
