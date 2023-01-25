//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import Foundation

struct QuizBrain {
    var quiz = [
        Question(flag: "🇦🇺", country: "Австралии", capital: "Канберра"),
        Question(flag: "🇦🇹", country: "Австрии", capital: "Вена"),
        Question(flag: "🇦🇿", country: "Азербайджана", capital: "Баку"),
        Question(flag: "🇦🇽", country: "Аландских островов", capital: "Мариехамн"),
        Question(flag: "🇦🇱", country: "Албании", capital: "Тирана"),
        Question(flag: "🇩🇿", country: "Алжира", capital: "Алжир"),
        Question(flag: "🇦🇸", country: "Американского Самоа", capital: "Паго-Паго"),
        Question(flag: "🇦🇮", country: "Ангильи", capital: "Валли"),
        Question(flag: "🇦🇴", country: "Анголы", capital: "Луанда"),
        Question(flag: "🇦🇩", country: "Андорры", capital: "Андорра-ла-Велла"),
        Question(flag: "🇦🇶", country: "Антарктиды", capital: "Мак-Мердо"),
        Question(flag: "🇦🇬", country: "Антигуа и Барбуды", capital: "Сент-Джонс"),
        Question(flag: "🇦🇷", country: "Аргентины", capital: "Буэнос-Айрес"),
        Question(flag: "🇦🇲", country: "Армении", capital: "Ереван"),
        Question(flag: "🇦🇼", country: "Арубы", capital: "Ораньестад"),
        Question(flag: "🇦🇫", country: "Афганистана", capital: "Кабул"),
        Question(flag: "🇧🇸", country: "Багамских островов", capital: "Нассау"),
        Question(flag: "🇧🇩", country: "Бангладеша", capital: "Дакка"),
        Question(flag: "🇧🇧", country: "Барбадоса", capital: "Бриджтаун"),
        Question(flag: "🇧🇭", country: "Бахрейна", capital: "Манама"),
        Question(flag: "🇧🇾", country: "Беларуси", capital: "Минск"),
        Question(flag: "🇧🇿", country: "Белиза", capital: "Бельмопан"),
        Question(flag: "🇧🇪", country: "Бельгии", capital: "Брюссель"),
        Question(flag: "🇧🇯", country: "Бенина", capital: "Порто-Ново"),
        Question(flag: "🇧🇲", country: "Бермудских островов", capital: "Гамильтон"),
        Question(flag: "🇧🇬", country: "Болгарии", capital: "София"),
        Question(flag: "🇧🇴", country: "Боливии", capital: "Ла-Пас/Сукре"),
        Question(flag: "🇧🇶", country: "Бонэйр", capital: "Кралендейк"),
        Question(flag: "🇧🇦", country: "Боснии и Герцеговины", capital: "Сараево"),
        Question(flag: "🇧🇼", country: "Ботсваны", capital: "Габороне"),
        Question(flag: "🇧🇷", country: "Бразилии", capital: "Бразилиа"),
        Question(flag: "🇧🇳", country: "Брунея", capital: "Бандар-Сери-Бегаван"),
        Question(flag: "🇧🇫", country: "Буркина-Фасо", capital: "Уагадугу"),
        Question(flag: "🇧🇮", country: "Бурунди", capital: "Гитега"),
        Question(flag: "🇧🇹", country: "Бутана", capital: "Тхимпху"),
        Question(flag: "🇻🇺", country: "Вануату", capital: "Порт-Вила"),
        Question(flag: "🇻🇦", country: "Ватикана", capital: "Папский Престол"),
        Question(flag: "🇬🇧", country: "Великобритании", capital: "Лондон"),
        Question(flag: "🏴󠁧󠁢󠁥󠁮󠁧󠁿", country: "Англии", capital: "Лондон"),
        Question(flag: "🏴󠁧󠁢󠁳󠁣󠁴󠁿", country: "Шотландии", capital: "Эдинбург"),
        Question(flag: "🏴󠁧󠁢󠁷󠁬󠁳󠁿", country: "Уэльса", capital: "Кардифф"),
        Question(flag: "🇭🇺", country: "Венгрии", capital: "Будапешт"),
        Question(flag: "🇻🇪", country: "Венесуэлы", capital: "Каракас"),
        Question(flag: "🇹🇱", country: "Восточного Тимора", capital: "Дили"),
        Question(flag: "🇻🇳", country: "Вьетнама", capital: "Ханой"),
        Question(flag: "🇬🇦", country: "Габона", capital: "Либревиль"),
        Question(flag: "🇭🇹", country: "Гаити", capital: "Порт-о-Пренс"),
        Question(flag: "🇬🇾", country: "Гайаны", capital: "Джорджтаун"),
        Question(flag: "🇬🇲", country: "Гамбии", capital: "Банжул"),
        Question(flag: "🇬🇭", country: "Ганы", capital: "Аккра"),
        Question(flag: "🇬🇵", country: "Гваделупы", capital: "Бас-Тер"),
        Question(flag: "🇬🇹", country: "Гватемалы", capital: "Гватемала"),
        Question(flag: "🇬🇳", country: "Гвинеи", capital: "Конакри"),
        Question(flag: "🇬🇼", country: "Гвинеи-Бисау", capital: "Бисау")
    ]
    
    var questionNumber = 0
    var score = 0
    var totalLevels = 0
    var currentFlagName = ""
    var quizDuplicate = [Question]()
    var hasNextQuestion = true
    var result = [String]()
    var correctAnswer = ""
    
    mutating func updateValues() -> [String] {
        result.removeAll()
        let random4 = Int.getUniqueRandomNumbers(min: 0, max: quiz.count-1, count: 4)
        correctAnswer = quiz[random4[0]].name

        result.append(quiz[random4[0]].name)
        result.append(quiz[random4[1]].name)
        result.append(quiz[random4[2]].name)
        result.append(quiz[random4[3]].name)

        result.shuffle()
        result.insert(quiz[random4[0]].flag, at: 0)
        currentFlagName = quiz[random4[0]].name
        
        return result
    }
    
    func getCorrectAnswer() -> String {
        return correctAnswer
    }
    
    mutating func newGameStarted() {
        self.questionNumber = 0
        self.score = 0
        quiz.shuffle()
        quizDuplicate = quiz.map { $0 }
        
    }
    
    mutating func checkAnswer(_ userAnswer: String ) -> Bool {
        if userAnswer == currentFlagName {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func shuffleTheArray(array: [String]) -> [String] {
        array.shuffled()
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < 20 {
            questionNumber += 1
            hasNextQuestion = true
        } else {
            hasNextQuestion = false
        }
    }
    
    func getNumberOfLevel() -> Int {
        let result = questionNumber
        return result
    }
    
    func getTotalNumberOfLevel() -> Int {
        return 20//quiz.count
    }
    
    func getScore() -> Int {
        return score
    }
}

extension Int {
    static func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: min...max))
        }
        return Array(set)
    }
}
