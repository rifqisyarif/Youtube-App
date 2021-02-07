//
//  ContentView.swift
//  Youtube
//
//  Created by Reefkey on 28/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Beranda")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "paperplane.fill")
                        Text("Explore")
                    }
                Home()
                    .tabItem {
                        Image(systemName: "tray.fill")
                        Text("Subscribe")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct Home: View {
    var body: some View {
        NavigationView{
            
            Kontent()
                
                .navigationBarItems(
                    leading:
                        HStack{
                            Button(action: {print("Hello Button")}){
                                Image("youtube_logo2")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 90, height: 20)
                            }
                        },
                    trailing:
                        HStack(spacing:20){
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "tray.fill")
                                    .foregroundColor(Color.secondary)
                            }
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "video.fill")
                                    .foregroundColor(Color.secondary)
                            }
                            Button(action: {print("Hello Button")}){
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.secondary)
                            }
                            Button(action: {print("Hello Button")}){
                                NavigationLink(destination: SettingView()){
                                    Image("profile")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .clipShape(Circle())
                                }
                            }
                        }
                )
                .navigationBarTitle("",displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Kontent : View {
    var body: some View {
        List{
            
            CellKontent(imageKontent: "kokbisa_bola", profileKontent: "kok_bisa", judul: "Kenapa bumi bulat seperti bola?", deskripsi: "#Trending 1,Apa hayo bumi bulat atau datar?", durasi: "15:00")
            CellKontent(imageKontent: "kokbisa_kimia", profileKontent: "kok_bisa", judul: "Apa fungsi kimia?", deskripsi: "#Trending 2,sebenarnya ane gk suka kimia ;-;", durasi: "3:00")

            CellKontent(imageKontent: "kokbisa_kesehatan", profileKontent: "kok_bisa", judul: "Obat covid itu makan enak!!!", deskripsi: "#Trending 3,Kalau mau terhindar dari covid obatnya makan wenak!", durasi: "15:00")

        }
    }
}

//komponen untuk sel
struct CellKontent : View {
    var imageKontent: String
    var profileKontent: String
    var judul: String
    var deskripsi: String
    var durasi: String
    
    var body: some View {
        //kontent 1
        VStack{
            ZStack (alignment: .bottomTrailing){
                Image(imageKontent)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                Text(durasi)
                    .padding()
                    .foregroundColor(.white)
                    .font(.caption)
                    .background(Color.black)
                    .cornerRadius(5)
                    .padding(.trailing,5)
                    .padding(.bottom, 5)
            }
            HStack{
                Image(profileKontent)
                    .resizable()
                    .frame(width: 30, height: 30 )
                    .clipShape(Circle())
                VStack (alignment: .leading){
                    Text(judul)
                        .font(.headline)
                    HStack{
                        Text(deskripsi)
                            .font(.caption)
                    }
                }
                
                Spacer()
                Image(systemName:"List.bullet")
            }
        }
    }
}
