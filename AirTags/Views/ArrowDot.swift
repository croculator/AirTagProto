//
//  ArrowDot.swift
//  AirTags
//
//  Created by Michael Diaz on 4/21/21.
//

import SwiftUI
import MapKit

struct ArrowDot: View {
    @Binding var progress: Double
    @Binding var angle: Double
    @Binding var bearingFromMe: Double
    
//    var bearing: Double = 0.0
//    var progress = 0.0
    
    


    var body: some View {
        ZStack {
//            Color.green.edgesIgnoringSafeArea(.all)


            Circle()
                .trim(from: 0.0, to: CGFloat(min(0.001, 1)))
                .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.white)
                .rotationEffect(Angle(degrees: -90.0))
                .animation(.linear)
                .frame(width: 320, height: 320)
                .rotationEffect(Angle(degrees: bearingFromMe))

            
            Image(systemName: "arrow.up")
                .font(.system(size: 192, weight: .bold))
                .rotationEffect(Angle(degrees: bearingFromMe))
                .foregroundColor(Color(UIColor.white))

            
            //dashed ticks
//            Circle()
//                .trim(from: 0, to: 0.5)
//               .stroke(Color.black ,style: StrokeStyle(lineWidth: 3, lineCap: .butt, dash: [1,30], dashPhase: 10))
//               .frame(width: 230, height: 230)
//                .rotationEffect(Angle(degrees: 180.0))



//            VStack (alignment: .trailing) {
//                Text("\(self.progress, specifier: "%.1f")")
//                    .font(.system(size: 45, weight: .medium, design: .rounded))
//                    .bold()
//                    .padding(.bottom, -20.0)
//
//
//                Text("MPH")
//                    .font(.system(size: 15, weight: .medium, design: .rounded))
//
//
//            }
//            .padding(.bottom, 30.0)
        }
        .padding(.vertical)
        
    }
}

struct ArrowDot_Previews: PreviewProvider {
    static var previews: some View {
        ArrowDot(progress: .constant(0.0), angle: .constant(0), bearingFromMe: .constant(32.0))
    }
}
