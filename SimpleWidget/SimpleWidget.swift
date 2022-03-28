//
//  SimpleWidget.swift
//  SimpleWidget
//
//  Created by khawlah khalid on 28/03/2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of seven entries a day apart, starting from the current day.
        let currentDate = Date()
        for dayOffset in 0..<7{
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
                    entries.append(entry)
            
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
           completion(timeline)

    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}


@main
struct SimpleWidget: Widget {
    let kind: String = "SimpleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SimpleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct SimpleWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            VStack(spacing:5){
        Text(getMonth())
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal,20)
                    .background(Rectangle().fill(Color.red))
                Text(getDay())
                Text(getDate())
                    .font(.largeTitle)

            }
            .background(Rectangle().fill(Color("WidgetBackground")))
            .padding(20)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            
        }.ignoresSafeArea()
           
    }
    
    private func getDay()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        return dateFormatter.string(from:entry.date)
        
    }
    private func getDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from:entry.date)
        
    }
    private func getMonth()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from:entry.date)
        
    }
}
struct SimpleWidget_Previews: PreviewProvider {
    static var previews: some View {
        SimpleWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
