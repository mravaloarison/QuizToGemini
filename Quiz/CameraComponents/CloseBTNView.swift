
struct CloseBTNView: View {
    @StateObject var camera = CameraModel()

    var body: some View {
        HStack {
            Spacer()
            Button {
                camera.isTaken.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(Circle())
            }
        }
    }
}