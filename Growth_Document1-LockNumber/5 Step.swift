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
//    var resultString: String {
    var resultCount: Int{       //<----
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
//            if correctCount == 4 {
//                return "모두 일치합니다"
            return correctCount          //변화된 correcttCount그대로 반환시킴(=\'넘겨준다'/).그리고 아래도 지움
            }
//            return "\(correctCount)개의 비밀번호 일치"
        }
                            
                ///---------------> 윗부분을 저렇게 굳이 ...바꾼  이유???
                /// correctCount자체를  그냥 resultCount라고 바꿔준후 위의 선언부에서도 타입을 string에서 int값으로 바꿔서
                ///맞춘숫자부분(모두일치)을 그냥 반환하도록하여...... 관련된 코드가 저쪽 아래쪽에내려가서 돌아가도록 좀 관리해볼까?란 아이디어로....
                ///그러면 아래내려가서 TEXT부분을 Text("\(resultString)") ---->    Text("\(resultCount)개 맞췄습니다") 바꾸면 끝!!!!!1
                ///그렇다면 맞춘개수에따라 텍스트를 다르게 나타내고싶다면???----> 어차피 아래쪽으로 다내려보냈으니
                ///거기쪽에다가 switch ~ case~ 구문 이용해볼까?
    
    
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
                    [ \(userInputValue_1) \(userInputValue_2) \(userInputValue_3) \(userInputValue_4) ] 입니다
                """)
            .multilineTextAlignment(.center)
                .padding(.top, 50.0)
                .font(.title2)
                .fontWeight(.heavy)
            

            //markDown 결과를 표시하는부분( 자물쇠 비번 일치, 불일치)
//            Text("\(resultString)")
            Text("\(resultCount)개 맞췄습니다")
                .padding()
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.yellow)
            
            
            //markDown 숫자갯수에 따른 다양한 결과 텍스트
            //markDown(2) 이미지도 추가(링크)
            //참고로 기억해둘것 -------> SwiftUI의 body선언에서 print문은 못들어가나(x)
            //                       (제한적으로) if나 switch 등은 들어갈 수 있다(0)
            
            
            switch resultCount {
            case 1: //여기서 1은 count를 의미함(실험해봤음) 즉.. 0 넣어도됨
                VStack {
                    //이 Asyncimage이부분 아예 그냥 통으로 '문서'에서 복사해왔음
                    AsyncImage(url: URL(string: "https://jjalbang.today/jjv1sy.jpg")) { image in
                        image.resizable()
                            //.scaledToFill()     //따로 추가해봄
                            //.overlay(Material.ultraThin)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    //.background(Color.gray)       //따로 추가해봄
                    .clipShape(Circle())            //따로 추가해봄
                    
                    
                    Text("1개...겨우..??")
                        .font(.largeTitle)
                        .padding()
                }
                
            case 2:
                VStack {
                    AsyncImage(url: URL(string: "https://cdn.discordapp.com/attachments/1022387257317007360/1033300530556051556/IMG_1467.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("2개...겨우..??")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                }
                
            case 3:
                VStack {
                    AsyncImage(url: URL(string: "https://blog.kakaocdn.net/dn/cyZQNN/btrb7akqNfn/pG9T3TwbV1VntbGORx8JW0/img.jpg")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("3개...어라..??")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                }
                
            case 4:
                VStack {
                    AsyncImage(url: URL(string: "https://cdn.deupress.or.kr/news/photo/202104/6158_5619_5514.png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("4개...와우..!!")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                }
                
            default:
                VStack {
                    AsyncImage(url: URL(string: "https://mblogthumb-phinf.pstatic.net/MjAxODA2MDNfMjI2/MDAxNTI3OTY0ODU1Mjc0.raxU8TtBG-t4x6HG49CmQZj9egXIKj-QZOzAvIemazwg.hhpMu2oOBAXEngQ8zgjSdIBxiZWmm_ExuTlq81KX1dMg.JPEG.190208/KakaoTalk_20180514_015925630.jpg?type=w800")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 250, height: 250)
                    
                    Text("몇개 맞췄는지 통 모르겠네요...")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .padding()
                }
            }
            
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

