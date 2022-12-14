//
//  UniversitiesManager.swift
//  UniHelper
//
//  Created by Danila Belyi on 07.12.2022.
//

import Foundation

struct UniversitiesManager {
//    static let universities: [University] = [
//        University(
//            name: "Московский политехнический университет",
//            directions: [
//                Direction(city: "Москва", faculty : "Факультет Информационных Технологий", name: "Прикладная Информатика. Корпоративные Информационные Системы", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 247, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный факультет", name: "Спортивные транспортные средства", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык "], scores: 234, budgetPlaces: 20, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Факультет Химической Технологии и Биотехнологии", name: "Биотехнология", subjects: ["Математика (профиль)", "Биология/Химия", "Русский язык"], scores: 237, budgetPlaces: 33, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Факультет урбанистики и городского хозяйства", name: "Промышленное и гражданское строительство (Строительство)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 208, budgetPlaces: 57, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Факультет экономики и управления", name: "Реклама и связи с общественностью в цифровых медиа", subjects: ["Обществознание", "История/Иностранный язык", "Русский язык"], scores: 282, budgetPlaces: 15, payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Факультет экономики и управления", name: "Интегрированные бренд-коммуникации (Реклама и связи с общественностью)", subjects: ["Обществознание", "История/Иностранный язык", "Русский язык"], scores: 282, budgetPlaces: 15,payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Химической техноллогии и биотехнологии", name: "Безотходные производственные технологии (Техносферная безопасность)", subjects: ["Математика (профиль)", "Физика/Химия", "Русский язык"], scores: 175, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Химической техноллогии и биотехнологии", name: "Экологическая безопасность и охрана труда (Техносферная безопасность)", subjects: ["Математика (профиль)", "Физика/Химия", "Русский язык"], scores: 152, budgetPlaces: 55, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Промышленное и гражданское строительство (Строительство)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 208, budgetPlaces: 57,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Автоматизированные энергетические установки (Энергетическое машиностроение)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 177, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Системы дальней связи (Радиотехника)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 191, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Строительство уникальных зданий и сооружений", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 215, budgetPlaces: 30, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Теплоэнергетика и теплотехника", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 186, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Электроэнергетика и электротехника", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 210, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный", name: "Интеллектуальные системы управления транспортом (Прикладная математика и информатика)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 238, budgetPlaces: 31,payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный", name: "Компьютерный инжиниринг в автомобилестроении (Наземные транспортно-технологические средства)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 185, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный", name: "Перспективные транспортные средства (Наземные транспортно-технологические средства)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 221, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный", name: "Программирование и цифровые технологии в динамике и прочности (Прикладная механика)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 212, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Транспортный", name: "Энергоустановки для транспорта и малой энергетики (Энергетическое машиностроение)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 185, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Технологии упраковочного производства", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Информационные системы автоматизированных комплексов медиаиндустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 238, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Бизнес-процессы печатной и упаковочной индустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Дизайн и проектирование мультимедиа и визуального контента", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Материаловедение и цифровые технологии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика/Химия", "Русский язык"], scores: 170, budgetPlaces: 19,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Ресурсное обеспечение печатной и упаковочной индустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
//                Direction(city: "Москва", faculty : "Полиграфический", name: "Управление качеством на производстве", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 192, budgetPlaces: 19,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107")])
//    ]
    
    static var universities = [University]()
    
    static let studyAreas = [
        "Математические и естественные науки",
        "Инженерное дело, технологии и технические науки",
        "Здравоохранение и медицинские науки",
        "Сельское хозяйство и сельскохозяйственные науки",
        "Науки об обществе",
        "Образование и педагогические науки",
        "Гуманитарные науки",
        "Искусство и культура"
    ]
    
    static let subjects = [
        "Математика (база)",
        "Математика (профиль)",
        "Русский язык",
        "Физика",
        "Химия",
        "История",
        "Обществознание",
        "Информатика и ИКТ",
        "Биология",
        "География",
        "Английский язык",
        "Немецкий язык",
        "Французский язык",
        "Испанский язык",
        "Китайский язык"
    ]
    
    static let faculties = [
        "Факультет Информационных Технологий",
        "Транспортный факультет",
        "Факультет химической технологии и биотехнологии",
        "Факультет урбанистики и городского хозяйства",
        "Факультет экономики и управления",
        "Полиграфический факультет"
    ]
    
    public func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public func parseJSON(_ universitiesData: Data) {
        do {
            let decodedData = try JSONDecoder().decode(UniversitiesData.self, from: universitiesData)
            
            UniversitiesManager.universities = decodedData.universities
        } catch {
            print(error)
        }
    }
}
