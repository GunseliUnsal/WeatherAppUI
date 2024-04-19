//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Günseli Ünsal on 19.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                CityNameView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :
                    "cloud.sun.fill",
                                      temperature: 27)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 24)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 27)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 21)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 23)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temperature: 24)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroundColor: .white,
                                  textColor: isNight ? . black : .blue)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            VStack{
                Image(systemName: imageName)
                    .symbolRenderingMode(.multicolor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
               Text("\(temperature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundStyle(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityNameView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName).font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("\(temperature)°").font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}


