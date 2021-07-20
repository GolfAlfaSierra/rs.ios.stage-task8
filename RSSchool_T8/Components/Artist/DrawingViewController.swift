//
//  Drawing.swift
//  RSSchool_T8
//
//  Created by John Kent on 19.07.2021.
//

import UIKit


@objc public class DrawingViewController: UIViewController {
    
    var selectedDrawing: SelectedDrawing = .DrawingHead
    
    private var selected = false
    private var selectedButton: UIButton!
    private var planet:UIButton!
    private var head:UIButton!
    private var tree:UIButton!
    private var landscape:UIButton!
    
    public override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = UIColor.lightGreenSea()
        self.title = "Drawings"
        
        
        
        
        
        tree = (self.view.subviews.first?.subviews[0] as! UIButton)
        landscape = (self.view.subviews.first?.subviews[1] as! UIButton)
        head = (self.view.subviews.first?.subviews[2] as! UIButton)
        planet = (self.view.subviews.first?.subviews[3] as! UIButton)
        
        
        let buttons = self.view.subviews.first!.subviews as! [DrawingButton]
        
        let drawingName = drawingTypeText(drawing: selectedDrawing)
        
        buttons.forEach({ v in
            if v.titleLabel?.text == drawingName {
                selectState(button: v)
            }
        })
        
        //        selectState(button: tree)
        
        
        
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
    
    @objc func setDrawing(draw: SelectedDrawing){
        self.selectedDrawing = draw
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
    
    
    func drawingTypeText(drawing: SelectedDrawing) -> String {
        switch drawing {
            case .DrawingHead:
                return "Head"
            case .DrawingLandscape:
                return "Landscape"
            case .DrawingPlanet:
                return "Planet"
            case .DrawingTree:
                return "Tree"
        @unknown default:
            fatalError()
        }
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

