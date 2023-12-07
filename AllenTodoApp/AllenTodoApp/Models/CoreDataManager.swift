//
//  CoreDataManager.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/7/23.
//

import CoreData
import UIKit


final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private init() {}
    
    // 앱 델리게이트
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    // 임시 저장소
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    // 엔티티 이름
    let modelName: String = "MemoData"
    
    //MARK: - [Read]
    func getTodoListFromCoreData() -> [MemoData] {
        var memoList: [MemoData] = []
        // 임시저장소 유무 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 정렬 순서 넘기기
            let dataOrder = NSSortDescriptor(key: "date", ascending: false)
            request.sortDescriptors = [dataOrder]
            
            do {
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    memoList = fetchedToDoList
                }
            } catch {
                //TODO: - enum으로 에러 처리 하기
                print("가져오는 것 실패")
            }
        }
        
        return memoList
    }
    
    // MARK: - [Create]
    func saveToDoData(toDoText: String?, colorInt: Int64, completion: @escaping () -> Void) {
        if let context = context {
            // 임시저장소에 있는 데이터를 그려줄 형태 파악
            if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
                // 임시저장소에 올라가게 할 객체만들기 (NSManagedObject ===> ToDoData)
                if let toDoData = NSManagedObject(entity: entity, insertInto: context) as? MemoData {
                    // MARK: - ToDoData에 실제 데이터 할당
                    toDoData.memoText = toDoText
                    toDoData.date = Date()   // 날짜는 저장하는 순간의 날짜로 생성
                    toDoData.color = colorInt
                    
                    if context.hasChanges {
                        do {
                            try context.save()
                            completion()
                        } catch {
                            print(error)
                            completion()
                        }
                    }
                }
            }
        }
        completion()
    }
    
    // MARK: - [Delete]
    func deleteToDo(data: MemoData, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = data.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    
                    // 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
                    if let targetToDo = fetchedToDoList.first {
                        context.delete(targetToDo)
                        
                        //appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    // MARK: - [Update]
    func updateToDo(newToDoData: MemoData, completion: @escaping () -> Void) {
        // 날짜 옵셔널 바인딩
        guard let date = newToDoData.date else {
            completion()
            return
        }
        
        // 임시저장소 있는지 확인
        if let context = context {
            // 요청서
            let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            // 단서 / 찾기 위한 조건 설정
            request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
            
            do {
                // 요청서를 통해서 데이터 가져오기
                if let fetchedToDoList = try context.fetch(request) as? [MemoData] {
                    // 배열의 첫번째
                    if var targetToDo = fetchedToDoList.first {
                        
                        // MARK: - ToDoData에 실제 데이터 재할당(바꾸기) ⭐️
                        targetToDo = newToDoData
                        
                        //appDelegate?.saveContext() // 앱델리게이트의 메서드로 해도됨
                        if context.hasChanges {
                            do {
                                try context.save()
                                completion()
                            } catch {
                                print(error)
                                completion()
                            }
                        }
                    }
                }
                completion()
            } catch {
                print("지우는 것 실패")
                completion()
            }
        }
    }
    
    
}
