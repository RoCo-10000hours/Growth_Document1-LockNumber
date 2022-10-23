//
//  ContentView.swift
//  1-practice
//
//  Created by Ro-CO on 2022/10/23(일)
//

import SwiftUI

struct ContentView: View {
    
    //mark Down 랜덤한 숫자를 뽑아내는 변수 선언
    var randomInt = Int.random(in: 0..<5)
    
    //mark Down 결과를 보여주는 연산프로퍼티
    var resultString: String {
        get {
            if randomInt == Int(userInputValue) {           //양쪽을 다같은 타입으로 바꿔줬음 randomInt쪽타입으로
                return "맞습니다"
            }
            return "다릅니다"
        }
    }
    
    
    @State private var userInputValue: Double = 0
    
    
    var body: some View {   //body라는 연산프로퍼티
//        get {                //get return이 생략되어있음. 이런이유로 stack이 중복안되는이유.
//         return VStack {
        VStack {
            
           
//            TextField("숫자를 입력하세요", text: $userInputValue)//어차피 이부분은 아래쪽에서 슬라이더로 숫자선택 바인딩하기에. 바꾸자
            
            Slider(value: $userInputValue, in: 0...9, step: 1)
            
            Text("입력하신 숫자는 \(Int(userInputValue)) 입니다")
                .padding()
                .font(.headline)
                .fontWeight(.heavy)
            
            

            
            //markDown 사용자가 누른 숫자값
           // Text("\(userInputString)")
            //markDown 랜덤결과 맞혔는지, 틀렸는지표시
            Text("\(resultString)")
                .padding()
                .font(.headline)
             
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//여기까지가 어제했던
// 11 ~ 17번 슬라이드 바 추가부분임
//이것이후론 picker추가부분

