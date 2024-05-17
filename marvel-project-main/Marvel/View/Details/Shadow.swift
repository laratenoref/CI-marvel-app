//
//  test.swift
//  Marvel
//
//  Created by Clara Muniz on 21/11/23.
//

import SwiftUI

struct Shadow: View {
    var body: some View {
        VStack {
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.50),
                ],
                startPoint: UnitPoint(x: 0.5, y: 1),
                endPoint: UnitPoint(x: 0.5, y: 0)
            )
            .frame(width: 430, height: 84)
            
            Spacer()
            
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .black.opacity(0), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .frame(width: 430, height: 144)
        }
        .frame(height: 319)
    }
}


#Preview {
    Shadow()
}
