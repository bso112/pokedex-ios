//
//  ViewControllerRepresentable.swift
//  Pokedex
//
//  Created by Byeon Seonguk on 2022/09/10.
//

import SwiftUI



 
struct ViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {

    }
}
 
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ViewControllerRepresentation()
                .ignoresSafeArea()
                .previewDisplayName("main")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
        }
    }
}


