import SwiftUI
import IonicPortals

struct HelpView: View {
    var body: some View {
      PortalView(portal: .help)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
