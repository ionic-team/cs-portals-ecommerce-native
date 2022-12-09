import SwiftUI
import IonicPortals

struct ProfileView: View {
    var body: some View {
      PortalView(portal: .user)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
      ProfileView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
