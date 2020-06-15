//
//  ViewController.swift
//  MeAndLucaProj
//
//  Created by Ucha Dzotsenidze on 6/3/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class Canvas: UIView{
    
    fileprivate var strokecolor = UIColor.black
    fileprivate var strokeWidth: Float = 1
    
    var lines = [Line]()
    var color = UIColor()
    
    func setStrokeColor(color: UIColor){
        self.strokecolor = color
    }
    
    func setWidth(size: Float){
        self.strokeWidth = size
    }
    
    
    public func undo(){
        lines.popLast()
        setNeedsDisplay()
    }
    
    public func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {return}
        

        
        lines.forEach{ (line) in
            
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.width))
            
            for(index, point) in line.points.enumerated(){
                if index == 0{
                    context.move(to: point)
                }else{
                    context.addLine(to: point)
                }
            }
            
            context.strokePath()
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(Line.init(width: strokeWidth, color: strokecolor, points: []))
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        
        let location = touch.location(in: nil)
        
        guard var lastline = lines.popLast() else {return}
        
        lastline.points.append(location)
        
        lines.append(lastline)
        
        setNeedsDisplay()
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    
    @IBOutlet weak var toolsView: UIView!
    
    
//////////////////////////////////////
    @IBOutlet weak var purplebutton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenbutton: UIButton!
    @IBOutlet weak var bluebutton: UIButton!
    @IBOutlet weak var whitebutton: UIButton!
    @IBOutlet weak var greybutton: UIButton!
    @IBOutlet weak var yellowbutton: UIButton!
    @IBOutlet weak var orangebutton: UIButton!
    @IBOutlet weak var pinkbutton: UIButton!
    @IBOutlet weak var tealbutton: UIButton!
    @IBOutlet weak var clearbutton: UIButton!
    @IBOutlet weak var savebutton: UIButton!
    @IBOutlet weak var undobutton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var MinusButton: UIButton!
    
    
    //////////////////////////////////////
    

    @IBOutlet weak var toolsviewheight: NSLayoutConstraint!
    
    
    var isclicked = false
    
    let canvas = Canvas()
    
    override func loadView() {
        super.loadView()
        self.mainView.addSubview(canvas)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.frame = self.view.bounds
//        mainView.layer.borderWidth = 1
//        mainView.layer.borderColor = UIColor(red: 244/255, green: 133/255, blue: 44/255, alpha: 1).cgColor
        
        toolsviewheight.constant = 0
        redButton.isHidden = true
        purplebutton.isHidden = true
        greenbutton.isHidden = true
        bluebutton.isHidden = true
        whitebutton.isHidden = true
        greybutton.isHidden = true
        yellowbutton.isHidden = true
        orangebutton.isHidden = true
        pinkbutton.isHidden = true
        tealbutton.isHidden = true
        clearbutton.isHidden = true
        savebutton.isHidden = true
        undobutton.isHidden = true
        plusButton.isHidden = true
        MinusButton.isHidden = true
        
        canvas.backgroundColor = .white
    }

    
    
    @IBAction func onPencilClick(_ sender: UIBarButtonItem) {
        
        if isclicked == false{
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
                self.isclicked = true
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.08){
                    
                    
                    //self.toolsviewheight.constant = 101
                    self.toolsviewheight.constant = 101
                    self.redButton.isHidden = false
                          self.purplebutton.isHidden = false
                          self.greenbutton.isHidden = false
                          self.bluebutton.isHidden = false
                          self.whitebutton.isHidden = false
                          self.greybutton.isHidden = false
                          self.yellowbutton.isHidden = false
                          self.orangebutton.isHidden = false
                          self.pinkbutton.isHidden = false
                          self.tealbutton.isHidden = false
                          self.clearbutton.isHidden = false
                          self.savebutton.isHidden = false
                          self.undobutton.isHidden = false
                          self.plusButton.isHidden = false
                          self.MinusButton.isHidden = false
                    
                    
                    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
                        
                        self.mainView.frame.origin.y = 200
                        
                    })
                }
            })
            
        }else if isclicked == true
            {
               
                self.mainView.frame.origin.y = 0
                self.toolsviewheight.constant = 0
                
                redButton.isHidden = true
                purplebutton.isHidden = true
                greenbutton.isHidden = true
                bluebutton.isHidden = true
                whitebutton.isHidden = true
                greybutton.isHidden = true
                yellowbutton.isHidden = true
                orangebutton.isHidden = true
                pinkbutton.isHidden = true
                tealbutton.isHidden = true
                clearbutton.isHidden = true
                savebutton.isHidden = true
                undobutton.isHidden = true
                plusButton.isHidden = true
                MinusButton.isHidden = true
                
                self.isclicked = false
            }
            
        }
    
    @IBAction func onPurpleClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemPurple
        savebutton.backgroundColor = .systemPurple
        undobutton.backgroundColor = .systemPurple
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemPurple)
    }
    
    @IBAction func onGreenButton(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemGreen
        savebutton.backgroundColor = .systemGreen
        undobutton.backgroundColor = .systemGreen
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemGreen)
    }
    
    @IBAction func onRedClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemRed
        savebutton.backgroundColor = .systemRed
        undobutton.backgroundColor = .systemRed
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemRed)
    }
    @IBAction func onBlueClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemBlue
        savebutton.backgroundColor = .systemBlue
        undobutton.backgroundColor = .systemBlue
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemBlue)
    }
    
    @IBAction func onWhiteClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .white
        savebutton.backgroundColor = .white
        undobutton.backgroundColor = .white
        clearbutton.titleLabel?.textColor = .black
        savebutton.titleLabel?.textColor = .black
        undobutton.titleLabel?.textColor = .black
        canvas.setStrokeColor(color: UIColor.white)
    }
    
    @IBAction func onGreyButton(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemGray
        savebutton.backgroundColor = .systemGray
        undobutton.backgroundColor = .systemGray
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemGray)
    }
    
    @IBAction func onYellowClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemYellow
        savebutton.backgroundColor = .systemYellow
        undobutton.backgroundColor = .systemYellow
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemYellow)
    }
    
    @IBAction func onOringeClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemOrange
        savebutton.backgroundColor = .systemOrange
        undobutton.backgroundColor = .systemOrange
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemOrange)
    }
    @IBAction func onPinkClick(_ sender: UIButton) {
        
        clearbutton.backgroundColor = .systemPink
        savebutton.backgroundColor = .systemPink
        undobutton.backgroundColor = .systemPink
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemPink)
    }
    
    @IBAction func onTealClick(_ sender: UIButton) {
        clearbutton.backgroundColor = .systemTeal
        savebutton.backgroundColor = .systemTeal
        undobutton.backgroundColor = .systemTeal
        clearbutton.titleLabel?.textColor = .white
        savebutton.titleLabel?.textColor = .white
        undobutton.titleLabel?.textColor = .white
        canvas.setStrokeColor(color: UIColor.systemTeal)
    }
    
    
    @IBAction func onClearButton(_ sender: UIButton) {
        canvas.clear()
    }
    @IBAction func onUndoClick(_ sender: UIButton) {
        canvas.undo()
    }
    
    @IBAction func onPlusButton(_ sender: UIButton) {
        canvas.setWidth(size: canvas.strokeWidth + 1)
    }
    
    @IBAction func onMinusButton(_ sender: UIButton) {
        canvas.setWidth(size: canvas.strokeWidth - 1)
    }
    
}

