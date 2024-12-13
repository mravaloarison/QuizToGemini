
struct SolveBTNView: View {
    var body: some View {
        Button {
            //
        } label: {
            HStack (spacing: 0) {
                Text("Solve")
                    .padding(.horizontal, 20)
            
                Image(systemName: "wand.and.stars")
                    .padding()
            }
            .foregroundColor(.black)
            .background(.thickMaterial)
            .clipShape(.capsule)
        }
    }
}