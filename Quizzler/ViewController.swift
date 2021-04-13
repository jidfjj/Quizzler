import UIKit

class ViewController: UIViewController {
    
    let questions = [
        Question("马云是中国首富", true),
        Question("刘强东最早是在中关村卖光盘的", true),
        Question("苹果公司是目前是最牛的科技公司", false),
        Question("只要坚持下去就能学好代码", true),
        Question("王思聪是80后", true),
        Question("在国内可以正常访问google", false),
        Question("敲完1万行代码之后可以成为编程高手", true),
        Question("撒贝宁说过清华还行", false),
        Question("一直听Lebus的课可以变大牛", true),
        Question("网上说苹果不好用安卓好用的人大多数都是水军", true),
        Question("优酷比B站牛", false),
        Question("我帅", true)
    ]
    
    var questionIdx = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPage()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        checkAnswer(sender)
        updateUI()
        nextQuestion()
    }
    
    func initPage(){
        //init
        questionIdx = 0
        questionLabel.text = questions[0].questionText
        progressLabel.text = "1/12"
        progressBar.frame.size.width = view.frame.width / 12
        scoreLabel.text = "score: 0"
    }
    
    func updateUI() {
        questionIdx += 1
        if (questionIdx + 1) <= 12 {
            progressLabel.text = "\(questionIdx + 1)/12"
            progressBar.frame.size.width = (view.frame.width / 12) * CGFloat(questionIdx + 1)
        }

    }
    
    
    func nextQuestion() {
        if questionIdx <= (12 - 1) {
            questionLabel.text = questions[questionIdx].questionText
        } else {
            
            let alert = UIAlertController(title: "NICE!", message: "DO IT AGAIN?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "DO IT AGAIN", style: .default, handler: {(_) in
            
                self.questionIdx = 0
                self.questionLabel.text = self.questions[0].questionText
                self.progressLabel.text = "1/12"
                self.progressBar.frame.size.width = self.view.frame.width / 12
                self.scoreLabel.text = "score: 0"
                
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer(_ sender: UIButton) {
        if sender.tag == 1 {
            if questions[questionIdx].answer {
                score += 1
                scoreLabel.text = "score: \(score)"
                ProgressHUD.showSuccess("GOOD!")
            } else {
                ProgressHUD.showFailed("NOT GOOD!")
            }
        } else {
            if questions[questionIdx].answer == false {
                score += 1
                scoreLabel.text = "score: \(score)"
                ProgressHUD.showSuccess("GOOD!")
            } else {
                ProgressHUD.showFailed("NOT GOOD!")
            }
        }
    }
    
    func startOver() {
        
    }
    
    
    
}
