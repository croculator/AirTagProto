//
//  AirTagDirectionViewModel.swift
//  AirTags
//
//  Created by Michael Diaz on 4/21/21.
//

import Foundation
import CoreMotion
import Combine
import MapKit




class AirTagDirectionViewModel: ObservableObject {
    
    @Published var mode = Mode.left
    @Published var angle: Double = 30
    
    let motionManager: CMMotionManager
    let motion = CMDeviceMotion()

    var timer: Timer!
    
    
    @Published var magnetometerData_x: Double = 0.0
    @Published var magnetometerData_y: Double = 0.0
    @Published var magnetometerData_z: Double = 0.0
    
    @Published var gyroData_x: Double = 0.0
    @Published var gyroData_y: Double = 0.0
    @Published var gyroData_z: Double = 0.0
    
    @Published var heading: Double = 0.0


    
    let a = CLLocationCoordinate2D(latitude: 33.983847, longitude: -117.723834)// some CLLocationCoordinate2D
    let b = CLLocationCoordinate2D(latitude:  33.983772, longitude: -117.723779)// some CLLocationCoordinate2D

    let deltaL: Double
    let thetaB : Double
    let thetaA : Double
    let x : Double
    let y : Double
    @Published var selectedBearing: Double
    var bearing: Double
    let bearingInDegrees : Double
    
    
//    let myHeading: Double
    @Published var bearingFromMe: Double
    
    
    
//    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    init(motionManager: CMMotionManager = CMMotionManager()) {
        
        self.bearing = 0.0
        
        self.deltaL = b.longitude.toRadians - a.longitude.toRadians
        self.thetaB = b.latitude.toRadians
        self.thetaA = a.latitude.toRadians
        self.x = cos(thetaB) * sin(deltaL)
        self.y = cos(thetaA) * sin(thetaB) - sin(thetaA) * cos(thetaB) * cos(deltaL)
        self.bearing = atan2(x,y)
        self.bearingInDegrees = self.bearing.toDegrees
        
        self.selectedBearing = bearing
        
        self.bearing = 0.0

//        self.myHeading = 90.0 // (I'm facing east)
        self.bearingFromMe  = 0.0
//        print(bearingFromMe) // -53, sounds good
        
        self.motionManager = motionManager
                
//        self.motionManager.accelerometerUpdateInterval = 1 / 30
//        self.motionManager.magnetometerUpdateInterval = 1/30
//        self.motionManager.gyroUpdateInterval = 1/30
        self.motionManager.deviceMotionUpdateInterval = 1/60
        self.motionManager.showsDeviceMovementDisplay = true


        self.motionManager.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: OperationQueue.current!) { (deviceMotion, error) in
            guard error == nil else {
                print(error!)
                return
            }
            
            if let headingData = deviceMotion {
//                print(headingData.heading)
                self.heading = headingData.heading
                self.bearingFromMe = self.bearingInDegrees - self.heading
//                print(self.bearingFromMe)
                
                if self.bearingFromMe > -45 && self.bearingFromMe < 45 {
                    self.mode = .ahead
                } else if self.bearingFromMe > 45 && self.bearingFromMe < 135 {
                    self.mode = .right
                } else if self.bearingFromMe > -225 && self.bearingFromMe < -135 {
                    self.mode = .behind
                } else if self.bearingFromMe > -135 && self.bearingFromMe < -45 {
                    self.mode = .left
                }
            }
        }

//        self.motionManager.startMagnetometerUpdates(to: .main) { (magnetometerData, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let magnetData = magnetometerData {
//                self.magnetometerData_x = magnetData.magneticField.x
//                self.magnetometerData_y = magnetData.magneticField.y
//                self.magnetometerData_z = magnetData.magneticField.z
//            }
//        }
//
//        self.motionManager.startGyroUpdates(to: .main) { (gyroData, error) in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//
//            if let gyroData = gyroData {
//                self.gyroData_x = gyroData.rotationRate.x
//                self.gyroData_y = gyroData.rotationRate.y
//                self.gyroData_z = gyroData.rotationRate.z
//            }
//        }
    }

    enum Mode {
        case ahead, right, left, behind, nearby, here
    }
}


extension Double {
    var toRadians : Double {
        var m = Measurement(value: self, unit: UnitAngle.degrees)
        m.convert(to: .radians)
        return m.value
    }
    var toDegrees : Double {
        var m = Measurement(value: self, unit: UnitAngle.radians)
        m.convert(to: .degrees)
        return m.value
    }
}
