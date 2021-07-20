//
//  Drawing.swift
//  RSSchool_T8
//
//  Created by John Kent on 19.07.2021.
//

import UIKit


@objc public class DrawingViewController: UIViewController {
    
    private var selectedDrawing: SelectedDrawing = .DrawingHead
    
    private var selected = false
    private var selectedButton: UIButton!
    private var planet:UIButton!
    private var head:UIButton!
    private var tree:UIButton!
    private var landscape:UIButton!
    
    public override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.lightGreenSea()
        self.title = "Drawings"
        
        
        landscape = (self.view.subviews.first?.subviews[0] as! UIButton)
        head = (self.view.subviews.first?.subviews[1] as! UIButton)
        tree = (self.view.subviews.first?.subviews[2] as! UIButton)
        planet = (self.view.subviews.first?.subviews[3] as! UIButton)
        
        selectedButton = head
        
        selectState(button: tree)
        
        
        
        planet.addTarget(self, action: #selector(drawingSelected), for: .touchUpInside)
        head.addTarget(self, action: #selector(drawingSelected), for: .touchUpInside)
        tree.addTarget(self, action: #selector(drawingSelected), for: .touchUpInside)
        landscape.addTarget(self, action: #selector(drawingSelected), for: .touchUpInside)
        
        
    }
    
    
    @objc func drawingSelected(sender: UIButton){
        selectedButton = sender
        
        
        selectDrawing(button: selectedButton)
        notifyDrawingSelected()
    }
    
    func notifyDrawingSelected() {
        let drawing = drawingName(button: selectedButton)
        
        NotificationCenter.default.post(name: .init(rawValue: "app-drawing-saved"), object: drawing)
    }
    
    func drawingName(button: UIButton) -> String {
        return button.titleLabel!.text!
    }
    
    func selectDrawing(button: UIButton) {
        unselectState(button: planet)
        unselectState(button: head)
        unselectState(button: tree)
        unselectState(button: landscape)
        
//        button.layer.shadowColor = UIColor.lightGreenSea().cgColor
//        button.layer.shadowOpacity = 1
        selectState(button: button)
    }
    
    
    func selectState(button: UIButton) {
        button.layer.shadowColor = UIColor.lightGreenSea().cgColor
                button.layer.shadowOpacity = 1

    }
    
    func unselectState(button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
    }
    
}

class DrawingButton:UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    private func setup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.shadowOffset = .zero
        
        layer.shadowOpacity = 0.25
        
        layer.shadowRadius = 2
    }
    
   
    
}

