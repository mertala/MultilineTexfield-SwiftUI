//
//  ContentView.swift
//  MultilineTexfield-SwiftUI
//
//  Created by Mert Ala on 25.12.2019.
//  Copyright © 2019 Mert Ala. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var obj : observed
    var body: some View {
        
        VStack {
            MultiTextfield().frame(height: self.obj.size)
                .padding()
                .background(Color.gray)
                .cornerRadius(25)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct MultiTextfield: UIViewRepresentable {
    
    func makeCoordinator() -> MultiTextfield.Coordinator {
        
        return MultiTextfield.Coordinator(parent1: self)
    }
    
    
    @EnvironmentObject var obj : observed
    
    
    func makeUIView(context: UIViewRepresentableContext<MultiTextfield>) -> UITextView {
       
        let view = UITextView()
        view.font = .systemFont(ofSize:19)
        view.text = "Bir şeyler yaz"
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
    
        view.delegate = context.coordinator
        self.obj.size = view.contentSize.height
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<MultiTextfield>) {
        
     
        
    }


class Coordinator : NSObject, UITextViewDelegate {
    
    var parent : MultiTextfield
    
    init(parent1: MultiTextfield) {
        
        parent = parent1
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
        textView.textColor = .black
        
        
    }
    func textViewDidChange(_ textView: UITextView) {
        self.parent.obj.size = textView.contentSize.height
    }

}
    }


class observed : ObservableObject {
    
    @Published var size : CGFloat = 0
}
   
