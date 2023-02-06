//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import Foundation
import UIKit
import CoreData

class QuizBrain {
    
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
        Question(flag: "🇬🇼", country: "Гвинеи-Бисау", capital: "Бисау"),
        Question(flag: "🇩🇪", country: "Германии", capital: "Берлин"),
        Question(flag: "🇬🇬", country: "Гернси", capital: "Сейнт Питер Порт"),
        Question(flag: "🇬🇮", country: "Гибралтара", capital: "Гибралтар"),
        Question(flag: "🇭🇳", country: "Гондураса", capital: "Тегусигальпа"),
        Question(flag: "🇭🇰", country: "Гонконга", capital: "Гонконг"),
        Question(flag: "🇬🇩", country: "Гренады", capital: "Сент-Джорджес"),
        Question(flag: "🇬🇱", country: "Гренландии", capital: "Нуук"),
        Question(flag: "🇬🇷", country: "Греции", capital: "Афины"),
        Question(flag: "🇬🇪", country: "Грузии", capital: "Тбилиси"),
        Question(flag: "🇬🇺", country: "Гуама", capital: "Хагатна"),
        Question(flag: "🇩🇰", country: "Дании", capital: "Копенгаген"),
        Question(flag: "🇯🇪", country: "Джерси", capital: "Сент-Хельер"),
        Question(flag: "🇩🇯", country: "Джибути", capital: "Джибу́ти"),
        Question(flag: "🇩🇲", country: "Доминики", capital: "Розо"),
        Question(flag: "🇩🇴", country: "Доминиканской Республики", capital: "Санто-Доминго"),
        Question(flag: "🇪🇬", country: "Египта", capital: "Каир"),
        Question(flag: "🇿🇲", country: "Замбии", capital: "Лусака"),
        Question(flag: "🇪🇭", country: "Западной Сахары", capital: "Эль-Аюн"),
        Question(flag: "🇿🇼", country: "Зимбабве", capital: "Хараре"),
        Question(flag: "🇮🇱", country: "Израиля", capital: "Иерусалим"),
        Question(flag: "🇮🇳", country: "Индии", capital: "Нью-Дели"),
        Question(flag: "🇮🇩", country: "Индонезии", capital: "Джакарта"),
        Question(flag: "🇯🇴", country: "Иордании", capital: "Амман"),
        Question(flag: "🇮🇶", country: "Ирака", capital: "Багдад"),
        Question(flag: "🇮🇷", country: "Ирана", capital: "Тегеран"),
        Question(flag: "🇮🇪", country: "Ирландии", capital: "Дублин"),
        Question(flag: "🇮🇸", country: "Исландии", capital: "Рейкьявик"),
        Question(flag: "🇪🇸", country: "Испании", capital: "Мадрид"),
        Question(flag: "🇮🇹", country: "Италии", capital: "Рим"),
        Question(flag: "🇾🇪", country: "Йемена", capital: "Сана"),
        Question(flag: "🇨🇻", country: "Кабо-Верде", capital: "Прая"),
        Question(flag: "🇰🇿", country: "Казахстана", capital: "Астана"),
        Question(flag: "🇰🇭", country: "Камбоджи", capital: "Пном Пен"),
        Question(flag: "🇨🇲", country: "Камеруна", capital: "Яунде"),
        Question(flag: "🇨🇦", country: "Канады", capital: "Оттава"),
        Question(flag: "🇶🇦", country: "Катара", capital: "Доха"),
        Question(flag: "🇰🇪", country: "Кении", capital: "Найроби"),
        Question(flag: "🇨🇾", country: "Кипра", capital: "Никосия"),
        Question(flag: "🇰🇬", country: "Киргизии", capital: "Бишкек"),
        Question(flag: "🇰🇮", country: "Кирибати", capital: "Тарава"),
        Question(flag: "🇨🇳", country: "Китая", capital: "Пекин"),
        Question(flag: "🇰🇵", country: "КНДР", capital: "Пхеньян"),
        Question(flag: "🇨🇨", country: "Кокосовых островов (Килинг)", capital: "Уэст-Айленд"),
        Question(flag: "🇨🇴", country: "Колумбии", capital: "Богота"),
        Question(flag: "🇰🇲", country: "Коморских островов", capital: "Морони"),
        Question(flag: "🇨🇬", country: "Республики Конго", capital: "Браззавиль"),
        Question(flag: "🇨🇩", country: "Демократической Республики Конго", capital: "Киншаса"),
        Question(flag: "🇽🇰", country: "Косово", capital: "Приштина"),
        Question(flag: "🇨🇷", country: "Коста-Рики", capital: "Сан-Хосе"),
        Question(flag: "🇨🇮", country: "Кот-д’Ивуара", capital: "Ямусукро"),
        Question(flag: "🇨🇺", country: "Кубы", capital: "Гавана"),
        Question(flag: "🇰🇼", country: "Кувейта", capital: "Эль-Кувейт"),
        Question(flag: "🇨🇼", country: "Кюрасао", capital: "Виллемстад"),
        Question(flag: "🇱🇦", country: "Лаоса", capital: "Вьентьян"),
        Question(flag: "🇱🇻", country: "Латвии", capital: "Рига"),
        Question(flag: "🇱🇸", country: "Лесото", capital: "Масеру"),
        Question(flag: "🇱🇷", country: "Либерии", capital: "Монровия"),
        Question(flag: "🇱🇧", country: "Ливана", capital: "Бейрут"),
        Question(flag: "🇱🇾", country: "Ливии", capital: "Триполи"),
        Question(flag: "🇱🇹", country: "Литвы", capital: "Вильнюс"),
        Question(flag: "🇱🇮", country: "Лихтенштейна", capital: "Вадуц"),
        Question(flag: "🇱🇺", country: "Люксембурга", capital: "Люксембург"),
        Question(flag: "🇲🇺", country: "Маврикия", capital: "Порт-Луи"),
        Question(flag: "🇲🇷", country: "Мавритании", capital: "Нуакшот"),
        Question(flag: "🇲🇬", country: "Мадагаскара", capital: "Антананариву"),
        Question(flag: "🇾🇹", country: "Майотты", capital: "Мамудзу"),
        Question(flag: "🇲🇴", country: "Макао", capital: "Макао"),
        Question(flag: "🇲🇼", country: "Малави", capital: "Лилонегве"),
        Question(flag: "🇲🇾", country: "Малайзии", capital: "Куала-Лумпур"),
        Question(flag: "🇲🇱", country: "Мали", capital: "Бамако"),
        Question(flag: "🇲🇻", country: "Мальдивских островов", capital: "Мале"),
        Question(flag: "🇲🇹", country: "Мальты", capital: "Валлетта"),
        Question(flag: "🇲🇦", country: "Марокко", capital: "Рабат"),
        Question(flag: "🇲🇶", country: "Мартиники", capital: "Фор-де-Франс"),
        Question(flag: "🇲🇭", country: "Маршалловых островов", capital: "Маджуро"),
        Question(flag: "🇲🇽", country: "Мексики", capital: "Мехико"),
        Question(flag: "🇫🇲", country: "Микронезии", capital: "Паликир"),
        Question(flag: "🇲🇿", country: "Мозамбика", capital: "Мапуту"),
        Question(flag: "🇲🇩", country: "Молдовы", capital: "Кишинёв"),
        Question(flag: "🇲🇨", country: "Монако", capital: "Монако"),
        Question(flag: "🇲🇳", country: "Монголии", capital: "Улан-Батор"),
        Question(flag: "🇲🇸", country: "Монтсеррата", capital: "Плимут и Брейдс"),
        Question(flag: "🇲🇲", country: "Мьянмы (Бирмы)", capital: "Нейпьидо"),
        Question(flag: "🇳🇦", country: "Намибии", capital: "Виндхук"),
        Question(flag: "🇳🇷", country: "Науру", capital: "Ярен"),
        Question(flag: "🇳🇵", country: "Непала", capital: "Катманду"),
        Question(flag: "🇳🇪", country: "Нигера", capital: "Ниамей"),
        Question(flag: "🇳🇬", country: "Нигерии", capital: "Нигерии"),
        Question(flag: "🇳🇱", country: "Нидерландов", capital: "Амстердам"),
        Question(flag: "🇳🇮", country: "Никарагуа", capital: "Манагуа"),
        Question(flag: "🇳🇺", country: "Ниуэ", capital: "Алофи"),
        Question(flag: "🇳🇿", country: "Новой Зеландии", capital: "Веллингтон"),
        Question(flag: "🇳🇨", country: "Новой Каледонии", capital: "Нумеа"),
        Question(flag: "🇳🇴", country: "Норвегии", capital: "Осло"),
        Question(flag: "🇮🇲", country: "острова Мэн", capital: "Дуглас"),
        Question(flag: "🇳🇫", country: "острова Норфолк", capital: "Кингстон"),
        Question(flag: "🇨🇽", country: "острова Рождества", capital: "Флаинг Фиш Ков"),
        Question(flag: "🇸🇭", country: "острова Святой Елены", capital: "Джеймстаун"),
        Question(flag: "🇵🇳", country: "Питкэрна", capital: "Адамстаун"),
        Question(flag: "🇹🇨", country: "островов Тёркс и Кайкос", capital: "Коберн-Таун"),
        Question(flag: "🇦🇪", country: "Объединенных Арабских Эмиратов", capital: "Абу-Даби"),
        Question(flag: "🇴🇲", country: "Омана", capital: "Маскат"),
        Question(flag: "🇰🇾", country: "Каймановых островов", capital: "Джорджтаун"),
        Question(flag: "🇨🇰", country: "Островов Кука", capital: "Аваруа"),
        Question(flag: "🇵🇰", country: "Пакистана", capital: "Исламабад"),
        Question(flag: "🇵🇼", country: "Палау", capital: "Нгерулмуд"),
        Question(flag: "🇵🇸", country: "Палестинских территорий", capital: "Рамалла Иерусалим"),
        Question(flag: "🇵🇦", country: "Панамы", capital: "Панама-Сити"),
        Question(flag: "🇵🇬", country: "Папуа — Новой Гвинеи", capital: "Порт-Морсби"),
        Question(flag: "🇵🇾", country: "Парагвая", capital: "Асунсьон"),
        Question(flag: "🇵🇪", country: "Перу", capital: "Лима"),
        Question(flag: "🇵🇱", country: "Польши", capital: "Варшава"),
        Question(flag: "🇵🇹", country: "Португалии", capital: "Лиссабон"),
        Question(flag: "🇵🇷", country: "Пуэрто-Рико", capital: "Сан-Хуан"),
        Question(flag: "🇰🇷", country: "Южной Кореи", capital: "Сеул"),
        Question(flag: "🇷🇪", country: "Реюньона", capital: "Сен-Дени"),
        Question(flag: "🇷🇺", country: "России", capital: "Москва"),
        Question(flag: "🇷🇼", country: "Руанды", capital: "Кигали"),
        Question(flag: "🇷🇴", country: "Румынии", capital: "Бухарест"),
        Question(flag: "🇸🇻", country: "Сальвадора", capital: "Сан-Сальвадор"),
        Question(flag: "🇼🇸", country: "Самоа", capital: "Апиа"),
        Question(flag: "🇸🇲", country: "Сан-Марино", capital: "Сан-Марино"),
        Question(flag: "🇸🇹", country: "Сан-Томе и Принсипи", capital: "Сан-Томе"),
        Question(flag: "🇸🇦", country: "Саудовской Аравии", capital: "Эр-Рияд"),
        Question(flag: "🇲🇰", country: "Северной Македонии", capital: "Северной Македонии"),
        Question(flag: "🇲🇵", country: "Северных Марианских островов", capital: "Сайпан"),
        Question(flag: "🇸🇨", country: "Сейшельских островов", capital: "Виктория"),
        Question(flag: "🇧🇱", country: "Сен-Бартелеми", capital: "Густавия"),
        Question(flag: "🇵🇲", country: "Сен-Пьера и Микелона", capital: "Сен-Пьер"),
        Question(flag: "🇸🇳", country: "Сенегала", capital: "Дакар"),
        Question(flag: "🇻🇨", country: "Сент-Винсента и Гренадин", capital: "Кингстаун"),
        Question(flag: "🇰🇳", country: "Сент-Китса и Невиса", capital: "Бастер"),
        Question(flag: "🇱🇨", country: "Сент-Люсии", capital: "Кастри"),
        Question(flag: "🇷🇸", country: "Сербии", capital: "Белград"),
        Question(flag: "🇸🇬", country: "Сингапура", capital: "Сингапур"),
        Question(flag: "🇸🇽", country: "Синт-Мартена", capital: "Филипсбург"),
        Question(flag: "🇸🇾", country: "Сирии", capital: "Дамаск"),
        Question(flag: "🇸🇰", country: "Словакии", capital: "Братислава"),
        Question(flag: "🇸🇮", country: "Словении", capital: "Любляна"),
        Question(flag: "🇺🇸", country: "США", capital: "Вашингтон"),
        Question(flag: "🇸🇧", country: "Соломоновых островов", capital: "Хониара"),
        Question(flag: "🇸🇴", country: "Сомали", capital: "Могадишо"),
        Question(flag: "🇸🇩", country: "Судана", capital: "Хартум"),
        Question(flag: "🇸🇷", country: "Суринама", capital: "Парамарибо"),
        Question(flag: "🇸🇱", country: "Сьерра-Леоне", capital: "Фритаун"),
        Question(flag: "🇹🇯", country: "Таджикистана", capital: "Душанбе"),
        Question(flag: "🇹🇭", country: "Таиланда", capital: "Бангкок"),
        Question(flag: "🇹🇼", country: "Тайваня", capital: "Тайбэй"),
        Question(flag: "🇹🇿", country: "Танзании", capital: "Додома"),
        Question(flag: "🇹🇬", country: "Того", capital: "Ломе"),
        Question(flag: "🇹🇰", country: "Токелау", capital: "Нукунону"),
        Question(flag: "🇹🇴", country: "Тонга", capital: "Нукуалофа"),
        Question(flag: "🇹🇹", country: "Тринидада и Тобаго", capital: "Порт-оф-Спейн"),
        Question(flag: "🇹🇻", country: "Тувалу", capital: "Фунафути"),
        Question(flag: "🇹🇳", country: "Туниса", capital: "Тунис"),
        Question(flag: "🇹🇲", country: "Туркменистана", capital: "Ашхабад"),
        Question(flag: "🇹🇷", country: "Турции", capital: "Анкара"),
        Question(flag: "🇺🇬", country: "Уганды", capital: "Кампала"),
        Question(flag: "🇺🇿", country: "Узбекистана", capital: "Ташкент"),
        Question(flag: "🇺🇦", country: "Украины", capital: "Киев"),
        Question(flag: "🇼🇫", country: "Уоллиса и Футуны", capital: "Мата-Уту"),
        Question(flag: "🇺🇾", country: "Уругвая", capital: "Монтевидео"),
        Question(flag: "🇫🇴", country: "Фарерских островов", capital: "Торсхавн"),
        Question(flag: "🇫🇯", country: "Фиджи", capital: "Сува"),
        Question(flag: "🇵🇭", country: "Филиппин", capital: "Манила"),
        Question(flag: "🇫🇮", country: "Финляндии", capital: "Хельсинки"),
        Question(flag: "🇫🇰", country: "Фолклендских островов", capital: "Порт-Стэнли"),
        Question(flag: "🇫🇷", country: "Франции", capital: "Париж"),
        Question(flag: "🇬🇫", country: "Французской Гвианы", capital: "Кайенна"),
        Question(flag: "🇵🇫", country: "Французской Полинезии", capital: "Папеэте"),
        Question(flag: "🇹🇫", country: "Французских Южных Территорий", capital: "Сен-Пьер"),
        Question(flag: "🇭🇷", country: "Хорватии", capital: "Загреб"),
        Question(flag: "🇨🇫", country: "Центральноафриканской Республики", capital: "Банги"),
        Question(flag: "🇹🇩", country: "Чада", capital: "Нджамена"),
        Question(flag: "🇲🇪", country: "Черногории", capital: "Подгорица"),
        Question(flag: "🇨🇿", country: "Чехии", capital: "Прага"),
        Question(flag: "🇨🇱", country: "Чили", capital: "Сантьяго"),
        Question(flag: "🇨🇭", country: "Швейцарии", capital: "Берн"),
        Question(flag: "🇸🇪", country: "Швеции", capital: "Стокгольм"),
        Question(flag: "🇱🇰", country: "Шри-Ланки", capital: "Шри-Джаяварденепура-Котте"),
        Question(flag: "🇪🇨", country: "Эквадора", capital: "Кито"),
        Question(flag: "🇬🇶", country: "Экваториальной Гвинеи", capital: "Малабо"),
        Question(flag: "🇪🇷", country: "Эритреи", capital: "Асмара"),
        Question(flag: "🇸🇿", country: "Эсватини", capital: "Мбабане и Лобамба"),
        Question(flag: "🇪🇪", country: "Эстонии", capital: "Таллин"),
        Question(flag: "🇪🇹", country: "Эфиопии", capital: "Аддис-Абеба"),
        Question(flag: "🇿🇦", country: "ЮАР", capital: "Кейптаун, Претория, Блумфонтейн"),
        Question(flag: "🇸🇸", country: "Южного Судана", capital: "Джуба"),
        Question(flag: "🇯🇲", country: "Ямайки", capital: "Кингстон"),
        Question(flag: "🇯🇵", country: "Японии", capital: "Токио")
    ]
    
    var questionNumber = 0
    var score = 0
    var totalLevels = 0
    
    var quizDuplicate = [Question]()
    var result = [String]()
    
    var hasNextQuestion = true
    var correctAnswer = ""
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var userData = [User]()
    private var changeableList = [User]()
    
    func updateValuesForFlagMode() -> [String] {
        result.removeAll()
        quizDuplicate.remove(at: 0)

        let random4 = Int.getUniqueRandomNumbers(min: 1, max: quizDuplicate.count-1, count: 3)
        correctAnswer = quizDuplicate[0].name

        result.append(quizDuplicate[0].name)
        result.append(quizDuplicate[random4[0]].name)
        result.append(quizDuplicate[random4[1]].name)
        result.append(quizDuplicate[random4[2]].name)

        result.shuffle()
        result.insert(quizDuplicate[0].flag, at: 0)
        
        
        return result
    }
    
    func updateValuesForCapitalMode() -> [String] {
        result.removeAll()
        quizDuplicate.remove(at: 0)
//
        let random4 = Int.getUniqueRandomNumbers(min: 1, max: quizDuplicate.count-1, count: 3)
        correctAnswer = "\(quizDuplicate[0].name) \(quizDuplicate[0].flag)"
        result.append(correctAnswer)
        
        for i in 0..<3 {
            let variant = "\(quizDuplicate[random4[i]].name) \(quizDuplicate[random4[i]].flag)"
            result.append(variant)
        }
        result.shuffle()
        result.insert(quizDuplicate[0].capital, at: 0)
        
        return result
    }
    
    func updateValueForShuffleMode() -> [String] {
        let randomNumber = Int.getUniqueRandomNumbers(min: 1, max: 2, count: 1)
        switch randomNumber[0] {
        case 1:
            return updateValuesForFlagMode()
        case 2:
            return updateValuesForCapitalMode()
        default:
            print("haha")
        }
        return [""]
    }
    
    func getCorrectAnswer() -> String {
        return correctAnswer
    }
    
    func newGameStarted() {
        self.questionNumber = 0
        self.score = 0
        quiz.shuffle()
        quizDuplicate = quiz.map { $0 }
        
    }
    
    func checkAnswer(_ userAnswer: String ) -> Bool {
        if userAnswer == correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func nextQuestion() {
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
    
    
    
    //MARK: - Core Data functions
    
    func insertUserData(name: String, score: Int, mode: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)!
        let user = NSManagedObject(entity: entity, insertInto: context)
        
        user.setValue(name, forKey: "name")
        user.setValue(score, forKey: "score")
        user.setValue(mode, forKey: "mode")
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                context.rollback()
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getDataFromCoreData() {
        userData.removeAll()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        if let objects = try? appDelegate.persistentContainer.viewContext.fetch(fetchRequest) {
            userData = objects
        }
    }
    
    func removeUser(at row: Int) {
        let context = appDelegate.persistentContainer.viewContext
        context.delete(userData[row])
        do {
            try context.save()
        } catch {
            context.rollback()
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func getNumberOfUsers() -> Int {
        changeableList.count
    }
    
    func getName(at row: Int) -> String {
        changeableList[row].name ?? ""
    }
    
    func getScore(at row: Int) -> Int64 {
        changeableList[row].score
    }
    
    func getMode(at row: Int) -> String {
        userData[row].mode!
    }
    
    func getAllFlagUsers() -> [User] {
        changeableList.removeAll()
        userData.forEach { user in
            if user.mode == "Flags" {
                changeableList.append(user)
            }
        }
        return changeableList.sorted { u1, u2 in
            u1.score > u2.score
        }
    }
    
    func getAllCapitalUsers() -> [User] {
        changeableList.removeAll()
        userData.forEach { user in
            if user.mode == "Capitals" {
                changeableList.append(user)
            }
        }
        return changeableList
    }
    
    func getAllShuffleUsers() -> [User] {
        changeableList.removeAll()
        userData.forEach { user in
            if user.mode == "Shuffle" {
                changeableList.append(user)
            }
        }
        return changeableList
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
