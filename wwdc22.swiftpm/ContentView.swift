import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            GradientBackground()
            GradientStrokeCircle()
            TopLeftCircleGlow()
            SwiftLogoBottomGlow()
            SwiftLogoTop()
            LensFlare()
            VStack {
                Text("WWDC22")
                    .foregroundColor(.white)
                Spacer()
                Text("Call to code.")
                    .foregroundColor(Color(red: 198/255, green: 225/255, blue: 230/255))
            }
            .font(.title.weight(.bold))
            .padding(.vertical, 100)
        }
        .edgesIgnoringSafeArea(.all)
    }

    private struct GradientBackground: View {
        var body: some View {
            LinearGradient(colors: [Color(red: 2/255, green: 10/255, blue: 30/255), .black],
                           startPoint: .top, endPoint: .bottom)
        }
    }


    private struct GradientStrokeCircle: View {
        var body: some View {
            AngularGradient(colors: [.orange, .yellow, .green, .teal, .blue,
                                     .blue, .indigo, .indigo, .black, .black,
                                     .black, .purple, .purple, .purple, .black,
                                     .black, .black, .black, .black, .orange].reversed(),
                            center: .center, startAngle: .degrees(-90), endAngle: .degrees(270))
            .mask {
                Circle()
                    .stroke(lineWidth: 2)
            }
            .padding(25)
        }
    }

    private struct TopLeftCircleGlow: View {
        var body: some View {
            Circle()
                .foregroundColor(.blue)
                .padding(25)
                .blur(radius: 50)
                .opacity(0.5)
                .mask {
                    AngularGradient(colors: [.clear, .white, .clear, .clear, .clear],
                                    center: .center, angle: .degrees(135))
                    .mask {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                            Circle()
                                .foregroundColor(.black)
                                .padding(25)
                        }
                        .compositingGroup()
                        .luminanceToAlpha()
                    }
                }
        }
    }

    private struct SwiftLogo: View {
        var body: some View {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
        }
    }

    private struct SwiftLogoBottomGlow: View {
        var body: some View {
            SwiftLogo()
                .foregroundColor(.clear)
                .overlay {
                    LinearGradient(colors: [Color(red: 149/255, green: 196/255, blue: 218/255),
                                            Color(red: 64/255, green: 116/255, blue: 163/255),
                                            .white,
                                            Color(red: 64/255, green: 116/255, blue: 163/255),
                                            Color(red: 64/255, green: 116/255, blue: 163/255),
                                            Color(red: 64/255, green: 116/255, blue: 163/255),
                                            Color(red: 64/255, green: 116/255, blue: 163/255),
                                            Color(red: 2/255, green: 5/255, blue: 20/255),
                                            Color(red: 2/255, green: 5/255, blue: 20/255)],
                                   startPoint: .bottomTrailing, endPoint: .topLeading)
                    .mask {
                        SwiftLogo()
                    }
                }
                .padding(110)
                .offset(x: 1.5, y: 1.5)
        }
    }

    private struct SwiftLogoTop: View {
        var body: some View {
            SwiftLogo()
                .foregroundColor(.clear)
                .overlay {
                    LinearGradient(colors: [Color(red: 2/255, green: 5/255, blue: 20/255),
                                            Color(red: 6/255, green: 20/255, blue: 35/255),
                                            Color(red: 64/255, green: 96/255, blue: 130/255)],
                                   startPoint: .bottomTrailing, endPoint: .topLeading)
                    .mask {
                        SwiftLogo()
                    }
                }
                .padding(110)
        }
    }

    private struct LensFlare: View {
        var body: some View {
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .blur(radius: 50)
                    .opacity(0.5)
                LensFlareLine()
                LensFlareLine()
                    .scaleEffect(0.3)
                    .rotationEffect(.degrees(-40))
                    .blur(radius: 1)
                LensFlareLine()
                    .scaleEffect(0.25)
                    .rotationEffect(.degrees(85))
                    .blur(radius: 1)
                LensFlareLine()
                    .scaleEffect(0.2)
                    .rotationEffect(.degrees(-10))
                LensFlareLine()
                    .scaleEffect(0.15)
                    .rotationEffect(.degrees(-50))
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 2, height: 2)
                    .blur(radius: 1)
                    .shadow(color: .white, radius: 2, x: 0, y: 0)
                    .shadow(color: .white, radius: 2, x: 0, y: 0)
                    .shadow(color: .white, radius: 2, x: 0, y: 0)
            }
            .offset(x: -82, y: -64)
        }
    }

    private struct LensFlareLine: View {
        var body: some View {
            LinearGradient(stops: [.init(color: .clear, location: 0.49),
                                   .init(color: .blue, location: 0.5),
                                   .init(color: .clear, location: 0.51)],
                           startPoint: .top, endPoint: .bottom)
            .mask {
                RadialGradient(colors: [.white, .white, .white, .clear, .clear],
                               center: .center, startRadius: 0, endRadius: 250)
            }
            .blur(radius: 3)
            .opacity(0.25)
        }
    }
}
