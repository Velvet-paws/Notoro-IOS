
import SwiftUI

struct NButton<Destination: View>: View {
    public var text: String
    public var destination : ()-> Destination
    var body: some View {
        
        NavigationLink(destination: destination) {
            Text(text)
                .bold()
                .frame(width: 240, height: 45)
                .background(Color(.accent))
                .background(in:RoundedRectangle(cornerRadius: 36)
                )
                .foregroundStyle(Color(.systemBackground))
        }
    }
}


#Preview {
    NButton(text: "Hello World") {
        EmptyView()
    }
}
