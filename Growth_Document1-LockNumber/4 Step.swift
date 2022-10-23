//
//  ContentView.swift
//  1-practice
//
//  Created by Ro-CO on 2022/10/23(일)
//

import SwiftUI

struct ContentView: View {
    
    //markDown 랜덤한 숫자를 뽑아내는 변수 선언(중복4개)
    var randomInt_1 = Int.random(in: 0..<10)
    var randomInt_2 = Int.random(in: 0..<10)
    var randomInt_3 = Int.random(in: 0..<10)
    var randomInt_4 = Int.random(in: 0..<10)
    
    //markDown 랜덤한 숫자를 뽑아내는 변수 선언(중복4개)
    @State private var userInputValue_1: Int = 0
    @State private var userInputValue_2: Int = 0
    @State private var userInputValue_3: Int = 0
    @State private var userInputValue_4: Int = 0
    
    
    //markDown 결과를 보여주기 위한 연산프로퍼티
    //markDOwn(2) 추가기능으로 1개아닌 4개를 맞춰야 '일치'표시 ----> \count/ 를 이용
    var resultString: String {
        get {
            var correctCount: Int = 0
            if randomInt_1 == userInputValue_1 {
                //                return "일치합니다"
                //correctCount = correctCount + 1
                correctCount += 1
            }
            if randomInt_2 == userInputValue_2 {
                correctCount += 1
            }
            if randomInt_3 == userInputValue_3 {
                correctCount += 1
            }
            if randomInt_4 == userInputValue_4 {
                correctCount += 1
            }
            if correctCount == 4 {
                return "모두 일치합니다"
            }
            return "\(correctCount)개의 비밀번호 일치"
        }
            
    }
    
    
    var body: some View {
//        get {
//         return VStack {
        VStack {
            
            //markDown 픽커 4개 수직나열(스티일: 세그먼트)
            //ForEach 처음 사용해봄. 이건 기억해두면 좋을것 같다
            VStack {
                Picker(selection: $userInputValue_1, label: Text("비밀번호를 맞혀보세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
        
                Picker(selection: $userInputValue_2, label: Text("비밀번호를 맞혀보세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
//                .frame(width: 150.0, height: 150.0)
                .pickerStyle(.segmented)
                
                Picker(selection: $userInputValue_3, label: Text("비밀번호를 맞혀보세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
//                .frame(width: 150.0, height: 150.0)
                .pickerStyle(.segmented)
                
                Picker(selection: $userInputValue_4, label: Text("비밀번호를 맞혀보세요")) {
                    ForEach(0..<10, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
                
        
            //markDown 실시간으로 내가입력한 비밀변호 표시부분
            //텍스트와 텍스트필드의 차이점은
            //텍스트는 표시를 해주는거고, 텍스트는 사용자가 직접 입력하는것!
            //그러나 여기서는 사용자입력을 picker가 대신 해주기에 뺐음.
            Text("""
                    입력하신 비밀번호는
                    ( \(userInputValue_1),\(userInputValue_2),\(userInputValue_3),\(userInputValue_4) ) 입니다
                """)
            .multilineTextAlignment(.center)
                .padding(.top, 50.0)
                .font(.title2)
                .fontWeight(.heavy)
            

            //markDown 결과를 표시하는부분( 자물쇠 비번 일치, 불일치)
            Text("\(resultString)")
                .padding()
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.red)
            
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

//여기까지가
//21 ~ 29번까지의 과정(픽커 4개 자물쇠 정답4개랜덤)

