//
//  ContentView.swift
//  AirTags
//
//  Created by Michael Diaz on 4/21/21.
//

import SwiftUI



struct ContentView: View {
 
    @StateObject var viewModel = AirTagDirectionViewModel()
    @State private var searching = Searching.data
    
    var body: some View {
        
        ZStack {

            ZStack {
                Circle()
                    .foregroundColor(Color.purple)
                    .frame(width: 320, height: 320)
                    .blur(radius: (1) * 20)
            }

//            if viewModel.mode == .ahead {
                Color.green.edgesIgnoringSafeArea(.all)
                    .opacity(1)
//            }
            

//            }
            
            
            ZStack {

                ArrowDot(progress: $viewModel.angle, angle: $viewModel.angle, bearingFromMe: $viewModel.bearingFromMe)
                    .opacity(0.9)
                

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(0.001, 1)))
                    .stroke(style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.white)
                    .rotationEffect(Angle(degrees: -90.0))
                    .animation(.linear)
                    .frame(width: 320, height: 320)
                    .rotationEffect(Angle(degrees: viewModel.selectedBearing))
                    .opacity(0.3)
                
                
                
            }
            .frame(width: 312, height: 312)

            .foregroundColor(Color(UIColor.white))


                
                VStack (alignment: .leading) {
                    
                    
                    VStack (alignment: .leading) {
                        Text("FINDING")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(Color.white)
                            .opacity(0.7)
                        Text(searching[0].itemTitle)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color.white)

//                        VStack {
//                            Text("X: \(viewModel.gyroData_x)")
//                            Text("X: \(viewModel.gyroData_y)")
//                            Text("X: \(viewModel.gyroData_z)")
//                            
//                            Text("Heading: \(viewModel.heading)")
//                            Text("bearing from me: \(viewModel.bearingFromMe)")
//                        }
                    }
                    .padding(.top)
                    .padding(.horizontal, 30.0)
                    
                    Spacer()
                    //Direction Distance
                    VStack (alignment: .leading) {
                         
                        HStack {
                            Text("\(searching[0].distanceFromUser, specifier: "%.1f")")
                                .foregroundColor(Color.white)

                            Text("ft")
                                .foregroundColor(.white)
                                .opacity(0.6)
                        }
                        .font(.system(size: 48, weight: .regular, design: .rounded))
                    

                        // Directions
                        HStack {
                            switch viewModel.mode {
                            case .right:
                                Text("to your")
                                    .foregroundColor(Color.white)
                                    .opacity(0.6)
                                Text("right")
                                    .foregroundColor(Color.white)
                            case .left:
                                Text("to your")
                                    .foregroundColor(Color.white)
                                    .opacity(0.5)
                                Text("left")
                                    .foregroundColor(Color.white)
                            case .behind:
                                Text("behind")
                                    .foregroundColor(Color.white)
                                Text("you")
                                    .foregroundColor(Color.white)
                            case .ahead:
                                Text("ahead")
                                    .foregroundColor(Color.white)
                            case .nearby:
                                Text("nearby")
                            case .here:
                                Text("here")
   
                            }
                        }
                        .font(.system(size: 48, weight: .regular, design: .rounded))

                        
                        HStack {
                            Button(action: {
                                //action
                            }) {
                                VStack  {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(Color.white)
                                        .padding(22)
                                        .background(Circle().fill(Color(UIColor.white))                                        .opacity(0.2))

                                }
                                .buttonStyle(PlainButtonStyle())

                //                .padding()
                //                .foregroundColor(Color("UIPurple"))
                //                .frame(width: 110, height: 100)
                //                .background(Color("buttonBG"))
                //                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            }
                            Spacer()
                            
                            Button(action: {
                                //action
                            }) {
                                VStack  {
                                    Image(systemName: "speaker.wave.3.fill")
                                        .font(.system(size: 24, weight: .semibold))
                                        .foregroundColor(Color.white)
                                        .padding(22)
                                        .background(Circle().fill(Color(UIColor.white))                                        .opacity(0.2))
                                }
                                .buttonStyle(PlainButtonStyle())

                            }
                        }
                    }
                    .padding(.horizontal, 30.0)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
