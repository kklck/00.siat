""" [연습]
    함수 정의 : count_words
    인자 : filename

    인자로 받은 파일명을 open 하여 파일을 읽어서 단어를 수를 출력한다.
    존재하지 않는 파일명으로 예외가 발생해도 아무런 일을 하지 않는다
"""
from fileinput import filename


def count_words(filename):
    try:
        f = open("./data/{}".format(filename), "r", encoding="utf-8")
    except Exception as e:
        print(e, "에러 발생")
    else:
        content = f.read()
        words = content.split()
        num = len(words)
        print(filename, "파일의 총 단어 수", num)
        f.close()


# 존재하지 않는 파일명도 있음
filenames = ['sample.xml', 'xxxx.xxx', 'temp.json']
for filename in filenames:
    count_words(filename)
print("========================")


f = open("i_have_a_dream.txt", "r")

contents = f.read()

print(contents)

f.close()