//
//  Tooltip.swift
//  picosite
//
//  Created by Mano Rajesh on 10/26/23.
//

import SwiftUI

struct Tooltip: View {
    @State private var isHovered = false
    var tooltipText: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hover over the rectangle!")
            
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 150, height: 50)
                    .onHover { hovering in
                        withAnimation {
                            isHovered = hovering
                        }
                    }
                
                if isHovered {
                    VStack {
                        Text(tooltipText)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.black)
                            .cornerRadius(5)
                            .offset(y: -30)
                            .shadow(radius: 3)
                        
                        Rectangle()
                            .fill(Color.black)
                            .frame(width: 10, height: 10)
                            .rotationEffect(.degrees(45))
                            .offset(y: -15)
                    }
                }
            }
        }
    }
}

#Preview {
    Tooltip(tooltipText: "Hello")
}
