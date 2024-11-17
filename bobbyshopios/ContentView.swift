import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        // Sử dụng WebView (WKWebView) trong SwiftUI
        WebView(url: "https://bobby-shop.com")
            .edgesIgnoringSafeArea(.all)  // Đảm bảo WebView phủ đầy toàn bộ màn hình
    }
}

// Tạo WebView thông qua UIViewRepresentable trong cùng một tệp
struct WebView: UIViewRepresentable {
    
    var url: String
    
    // Tạo WKWebView
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }

    // Cập nhật WKWebView khi cần thiết
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
