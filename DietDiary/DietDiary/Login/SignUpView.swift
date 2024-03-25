//
//  SignUpView.swift
//  DietDiary
//
//  Created by Jinhee on 3/20/24.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presention
    @State private var id: String = ""
    @State private var nickname: String = ""
    @State private var pwd: String = ""
    @State private var checkpwd: String = ""
    @State private var errorId = false
    @State private var successId = false
    
    var body: some View {
        ZStack {
            Color(r:254, g: 251, b: 233).ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    TextField("아이디", text: $id)
                        .padding()
                        .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .disableAutocorrection(true) // 자동완성 끄기
                    Spacer()
                    Button(action: {
                        // 중복 확인 버튼 눌러서 아이디를 api로 보내는 코드 작성
                    }) {
                        Text("중복 확인")
                            .bold()
                    }
                    .frame(width: 80, height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
                    .font(.system(size: 15))
                    .foregroundColor(Color.white)
                    
                }
                .padding(10)
                if successId {
                    Text("사용 가능한 아이디입니다.")
                        .foregroundColor(Color.red)
                }
                if errorId {
                    Text("중복된 아이디입니다.")
                        .foregroundColor(Color.red)
                }
                HStack {
                    Spacer()
                    TextField("별명", text: $nickname)
                        .padding()
                        .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .disableAutocorrection(true) // 자동완성 끄기
                    Spacer()
                }
                .padding(10)
                HStack {
                    Spacer()
                    SecureField("비밀번호", text: $pwd)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(10)
                HStack {
                    Spacer()
                    SecureField("비밀번호 확인", text: $checkpwd)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding(10)
                HStack {
                    Button(action: {
                        presention.wrappedValue.dismiss()
                    }) {
                        Text("뒤로가기")
                            .bold()
                    }
                    .frame(width: 100, height: 35)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.orange))
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    
                    Button(action: {
                        // 입력한 아이디, 비밀번호, 별명 api로 보내고 각각의 text 비워주는 코드 작성
                    }) {
                        Text("가입하기")
                            .bold()
                    }
                    .frame(width: 100, height: 35)
                    .background(RoundedRectangle(cornerRadius: 40).fill(Color.orange))
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                }
            }
        }
    }
}


#Preview {
    SignUpView()
}
