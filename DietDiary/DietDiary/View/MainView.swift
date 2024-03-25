//
//  MainView.swift
//  DietDiary
//
//  Created by Jinhee on 3/20/24.
//

import SwiftUI

struct MainView: View {
    @State private var date = Date() // 선택한 날짜
    @State private var habitlist = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(r:254, g: 251, b: 233).ignoresSafeArea()
                VStack {
                    HStack {
                        // 로그인하면 자신의 별명이 나옴
                        Text("별명")
                            .font(.system(size: 20))
                        Spacer()
                    }.padding()
                    HStack {
                        // 이번 달 목표를 작성할 수 있음
                        Text("이번 달 목표")
                            .font(.system(size: 20))
                        Spacer()
                    }
                    DatePicker("date", selection: $date, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .frame(maxHeight: 400)
                        .onChange(of: date, perform: { newValue in
                            habitlist.toggle()
                        })
                        .sheet(isPresented: self.$habitlist) {
                            ContentView()
                                .presentationDetents([.medium, .large])
                        }
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("아침")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                        }
                        Spacer()
                    }.padding()
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("점심")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                        }
                        Spacer()
                    }.padding()
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("저녁")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                        }
                        Spacer()
                    }.padding()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
