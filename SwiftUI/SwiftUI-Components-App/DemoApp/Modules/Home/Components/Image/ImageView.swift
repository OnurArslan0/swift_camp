import SwiftUI

struct ImageView: View {
    @ObservedObject var presenter: ImagePresenter
    let imageNames = ["atatürk", "ata2", "ata3", "ata4", "ata5", "ata6"]
    
    var body: some View {
        VStack {
            // Başlık
            Text("A Small Atatürk Exhibition")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            // Görselleri bir Grid ile düzenlemek için LazyVGrid
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20) {
                ForEach(imageNames, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                }
            }
            .padding()
            
            Button("1881-∞") {
                presenter.goBack()
            }
            .padding(.top, 20)
        }
    }
}
