//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Günseli Ünsal on 19.04.2024.
//

import SwiftUI

struct WeatherButton: View{
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(Color(backgroundColor))
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
