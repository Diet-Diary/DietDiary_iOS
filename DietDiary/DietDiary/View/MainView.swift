//
//  MainView.swift
//  DietDiary
//
//  Created by Jinhee on 3/20/24.
//

import SwiftUI
import UIKit

struct MainView: View {
    @State private var date = Date() // 선택한 날짜
    @State private var showImagePicker1 = false
    @State private var showImagePicker2 = false
    @State private var showImagePicker3 = false
    @State private var capturedImage1: UIImage?
    @State private var capturedImage2: UIImage?
    @State private var capturedImage3: UIImage?
    @State private var activeButton: Int? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(r:254, g: 251, b: 233).ignoresSafeArea()
                ScrollView() {
                    VStack {
                        HStack {
                            // 로그인하면 자신의 별명이 나옴
                            Text("별명")
                                .font(.system(size: 20))
                            Spacer()
                        }.padding()
                        HStack {
                            // 이번 달 목표를 작성할 수 있음
                            Text("이번 달 목표: ")
                                .font(.system(size: 20))
                            Spacer()
                        }
                        DatePicker("date", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.graphical)
                            .frame(maxHeight: 400)
                            
                        HStack {
                            Button(action: {
                                self.activeButton = 1
                                self.showImagePicker1 = true
                            }) {
                                Text("아침")
                                    .frame(width: 100, height: 35)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                            }
                            .sheet(isPresented: $showImagePicker1) {
                                ImagePicker(image: self.bindingForButton(1))
                            }
                            Spacer()
                        }.padding()
                        if let image1 = capturedImage1 {
                            Image(uiImage: image1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding()
                        } else {
                            Text("No Image")
                        }
                        HStack {
                            Button(action: {
                                self.activeButton = 2
                                self.showImagePicker2 = true
                            }) {
                                Text("점심")
                                    .frame(width: 100, height: 35)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                            }
                            .sheet(isPresented: $showImagePicker2) {
                                ImagePicker(image: self.bindingForButton(2))
                            }
                            Spacer()
                        }.padding()
                        if let image2 = capturedImage2 {
                            Image(uiImage: image2)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding()
                        } else {
                            Text("No Image")
                        }
                        HStack {
                            Button(action: {
                                self.activeButton = 3
                                self.showImagePicker3 = true
                            }) {
                                Text("저녁")
                                    .frame(width: 100, height: 35)
                                    .fontWeight(.semibold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.orange))
                            }
                            .sheet(isPresented: $showImagePicker3) {
                                ImagePicker(image: self.bindingForButton(3))
                            }
                            Spacer()
                        }.padding()
                        if let image3 = capturedImage3 {
                            Image(uiImage: image3)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .padding()
                        } else {
                            Text("No Image")
                        }
                    }
                }
            }
        }
    }
    
    private func bindingForButton(_ button: Int) -> Binding<UIImage?> {
        switch button {
        case 1:
            return $capturedImage1
        case 2:
            return $capturedImage2
        case 3:
            return $capturedImage3
        default:
            return $capturedImage1
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    MainView()
}
