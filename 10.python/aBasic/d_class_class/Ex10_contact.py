class Contact:
    def __init__(self, name, phone_number, email, addr):
        self.name = name
        self.phone_name = phone_number
        self.email = email
        self.addr = addr

    def print_info(self):
        print("이름:", self.name)
        print("전화번호:", self.phone_name)
        print("이메일:", self.email)
        print("주소:", self.addr)


def print_menu():
    print('1. 연락처 입력')
    print('2. 연락처 출력')
    print('3. 연락처 삭제')
    print('4. 종료')
    menu = input('메뉴선택:')
    return int(menu)


def set_contact():
    # 여기에 코드 작성
    return [input('이름은 ? '), input('전화번호는 ? '), input('이메일은 ? '), input('주소는 ? ')]


def print_contact(contact_list):
    # 여기에 코드 작성
    for i in contact_list:
        Contact(i[0], i[1], i[2], i[3]).print_info()
        if i == contact_list[len(contact_list) - 2]:
            print("=======================")


def delete_contact(contact_list, name):
    # 여기에 코드 작성
    for i in contact_list:
        if i[0] == name:
            contact_list.remove(i)


def run():
    # Contact 인스턴스를 저장할 리스트 자료구조 생성
    contact_list = []
    while True:
        menu = print_menu()
        if menu == 4:  # 종료를 선택하면
            break
        elif menu == 1:  # 입력을 선택하면
            contact = set_contact()
            contact_list.append(contact)
        elif menu == 2:  # 출력을 선택하면
            print_contact(contact_list)
        elif menu == 3:  # 삭제를 선택하면
            name = input('삭제할 이름은?')
            delete_contact(contact_list, name)
        elif menu == 4:
            print("실행을 종료합니다.")
            break
        else:
            print("올바른 번호를 입력해주세요.")


if __name__ == "__main__":
    run()
