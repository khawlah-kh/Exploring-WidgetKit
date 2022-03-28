//
//  SimpleWidgetEntryView.swift
//  WidgetKitExploredApp
//
//  Created by khawlah khalid on 28/03/2022.
//
import WidgetKit
import SwiftUI


struct SimpleWidgetEntryView1 : View {
    var entry: SimpleEntry

    var body: some View {
        ZStack{
            VStack(spacing:5){
        Text("Month")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal,20)
                    .background(Rectangle().fill(Color.red))
                Text("Day")
                Text("Date")
                    .font(.largeTitle)

            }
            .background(Rectangle().fill(Color("WidgetBackground")))
            .padding(20)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
        }.ignoresSafeArea()
    }
}

//struct SimpleWidgetEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleWidgetEntryView()
//    }
//}
