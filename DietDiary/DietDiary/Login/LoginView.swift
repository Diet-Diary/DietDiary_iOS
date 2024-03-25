//
//  LoginView.swift
//  DietDiary
//
//  Created by Jinhee on 3/20/24.
//

import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
}

struct LoginView: View {
    
    @State private var id: String = ""
    @State private var pwd: String = ""
    @State private var signup = false
    @State private var error = false
    @Binding var loginSuccess: Bool // 화면 전환 시 사용
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(r:254, g: 251, b: 233).ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 100)
                    HStack {
                        Spacer()
                        TextField("아이디", text: $id)
                            .padding()
                            .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                            .disableAutocorrection(true) // 자동완성 끄기
                        Spacer()
                    }
                    .padding(10)
                    HStack {
                        Spacer()
                        SecureField("비밀번호", text: $pwd)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        Spacer()
                    }
                    .padding(10)
                    HStack {
                        // 로그인 버튼
                        Button(action: {
                            // 아이디, 비밀번호 로그인 api 파라미터로 보내주는 코드 작성 
                        }) {
                            Text("로그인")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.orange))
                        }
                        // 회원가입 버튼
                        Button(action: {
                            self.signup = true
                        }) {
                            Text("회원가입")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.orange))
                                .sheet(isPresented: self.$signup) {
                                    SignUpView()
                                }
                        }
                    }
                    .padding()
                    Spacer()
                    // 로그인 실패 시 오류
                    if error {
                        Text("아이디 또는 비밀번호 오류")
                            .foregroundColor(Color.red)
                    }
                }
            }
        }
    }
}

//#Preview {
//    LoginView()
//}
