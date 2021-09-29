//
//  RatingView.swift
//  RatingView
//
//  Created by Eric Yang on 13.9.2021.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow

    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1) {number in
                self.image(for: number)
                    .foregroundColor(imageColor(for: number))
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    func imageColor(for number: Int) -> Color {
        if number == rating && rating == 1 {
            return Color.red
        } else if number <= rating {
            return onColor
        } else {
            return offColor
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
