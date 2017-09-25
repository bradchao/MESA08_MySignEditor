//
//  MyView.swift
//  MySignEditor
//
//  Created by user22 on 2017/9/25.
//  Copyright © 2017年 Brad Big Company. All rights reserved.
//

import UIKit

class MyView: UIView {

    private var lines:[[CGPoint]] = []
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        
        context?.setFillColor(red: 1, green: 1, blue: 0, alpha: 1)
        context?.fill(rect)
        
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)

        for line in lines {
            if line.count < 2 {continue}
            // 起點
            context?.move(to: line[0])
            
            for i in 1..<line.count {
                // 加點
                context?.addLine(to: line[i])
            }
            
            // 畫出來
            context?.drawPath(using: .stroke)
        }
        
        context?.restoreGState()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            var line:[CGPoint] = []
            line += [touch.location(in: self)]
            lines += [line]
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lines[lines.count-1] += [touch.location(in: self)]
            setNeedsDisplay()
        }
    }
    
    
    func clear(){
        lines = []
        setNeedsDisplay()
    }
}
