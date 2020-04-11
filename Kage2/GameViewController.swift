//
//  GameViewController.swift
//  Kage2
//
//  Created by goemon12 on 2020/04/11.
//  Copyright © 2020 goemon12. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var fmtH: DateFormatter!
    var fmtM: DateFormatter!
    var fmtS: DateFormatter!
    var txtDat: SCNText!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fmtH = DateFormatter()
        fmtM = DateFormatter()
        fmtS = DateFormatter()
        fmtH.dateFormat = "HH"
        fmtM.dateFormat = "mm"
        fmtS.dateFormat = "ss"
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/Kage2.scn")!

        let light = scene.rootNode.childNode(withName: "LIGHT", recursively: true)!
        
        light.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 5)))
        
        txtDat = scene.rootNode.childNode(withName: "TEXT3D", recursively: true)!.geometry as? SCNText
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black

        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {
            _ in

            let date = Date()
            let strH = self.fmtH.string(from: date)
            let strM = self.fmtM.string(from: date)
            let strS = self.fmtS.string(from: date)
            
            self.txtDat.string = "\(strH):\(strM):\(strS)"
        })
    }
}
