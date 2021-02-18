

import SwiftUI


struct AquaBubbleBackground: View {
    
    enum AquaStyle {
        case blueberry
        case lime
        case graphite
    }
    
    init(style: AquaStyle = .blueberry, reversedGradient: Bool = false) {
        
        var colors: [Color]
        switch style {
        case .blueberry:
            colors = [Color(red: 0.15, green: 0.5, blue: 0.8),
                      Color(red: 0.5, green: 0.85, blue: 1.0)]
        case .lime:
            colors = [Color(red: 0.27, green: 0.6, blue: 0.12),
                      Color(red: 0.4, green: 0.9, blue: 0.18)]
        default:
            colors = [Color(red: 0.4, green: 0.4, blue: 0.4),
                      Color(red: 0.6, green: 0.6, blue: 0.6)]
        }
        
        let gradient = Gradient(colors: reversedGradient ? colors.reversed() : colors)
        self.baseGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
        
    }
    
    private var baseGradient: LinearGradient
    
    private var glossGradient: LinearGradient = {
        let colors: [Color] = [Color.white.opacity(0.6),
                               Color.white.opacity(0.3),
                               Color.white.opacity(0.0)]
        let gradient = Gradient(colors: colors)
        return LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }()
    
    
    var body: some View {
        return ZStack {
            
            self.baseGradient
            
            self.glossGradient
                .mask(Capsule())
                .padding(.top, 3.0)
                .padding(.horizontal, 7.0)
                .padding(.bottom, 9.0)
                .blur(radius: 0.5)
            
        }
        .overlay(
            ZStack {
                
                Capsule() // Inner Shadow 1
                    .strokeBorder(lineWidth: 2.0)
                    .foregroundColor(Color.white)
                    .blur(radius: 3.0)
                    .opacity(1.0)
                    .blendMode(.softLight)

                Capsule() // Inner Shadow 2
                    .strokeBorder(lineWidth: 1.0)
                    .foregroundColor(Color.white)
                    .blur(radius: 1.5)
                    .opacity(0.8)
                    .blendMode(.softLight)
                
                Capsule() // Border
                    .strokeBorder(lineWidth: 1.0)
                    .opacity(0.32)
                
            }
        )
        .mask(Capsule())
        .shadow(color: Color.black.opacity(0.64), radius: 2.0, x: 0.0, y: 1.0)
    }
    
}



struct Background_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 14.0) {
            
            Text("What are you talking about?")
                .padding([.vertical], 10.0)
                .padding([.horizontal], 18.0)
                .font(Font.body.weight(.medium))
                .foregroundColor(Color.black)
                .shadow(color: Color.white.opacity(0.8), radius: 1.5, x: 0.0, y: 1.0)
                .background(AquaBubbleBackground(style: .blueberry))
            
            Text("What are you talking about?")
                .padding([.vertical], 10.0)
                .padding([.horizontal], 18.0)
                .font(Font.body.weight(.medium))
                .foregroundColor(Color.black)
                .shadow(color: Color.white.opacity(0.7), radius: 1.5, x: 0.0, y: 1.0)
                .background(AquaBubbleBackground(style: .lime))
                .offset(x: 24.0)
            
            Text("What are you talking about?")
                .padding([.vertical], 10.0)
                .padding([.horizontal], 18.0)
                .font(Font.body.weight(.medium))
                .foregroundColor(Color.black)
                .shadow(color: Color.white.opacity(0.6), radius: 1.5, x: 0.0, y: 1.0)
                .background(AquaBubbleBackground(style: .graphite, reversedGradient: true))
            
        }
        .padding(42.0)
    }
}
