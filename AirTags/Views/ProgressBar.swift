//
//  ProgressBar.swift
//  AirTags
//
//  Created by Michael Diaz on 4/21/21.
//

import SwiftUI

struct ProgressBar: View {
//    @Binding var progress: Float
    var progress = 0.7

    var body: some View {
        ZStack {
//            Circle()
//                .trim(from: 0, to: 0.5)
//                .stroke(lineWidth: 15.0)
//                .opacity(0.3)
//                .foregroundColor(Color.gray)
//                .frame(width: 200, height: 200)
//                .rotationEffect(Angle(degrees: 180.0))


            Circle()
                .trim(from: 0.0, to: CGFloat(min(0.001, 1)))
                .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.gray)
//                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
                .frame(width: 300, height: 300)
//                .rotationEffect(Angle(degrees: 360.0))
            
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

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
