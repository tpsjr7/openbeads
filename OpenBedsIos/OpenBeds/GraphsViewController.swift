import UIKit

class GraphsViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = URL(string: "http://openbed-gh.herokuapp.com/chart/"){
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        if let url = URL(string: "http://openbed-gh.herokuapp.com/chart/chart.png"){
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    

}
