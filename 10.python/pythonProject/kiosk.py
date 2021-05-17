import tkinter as tk
from struct import pack
from tkinter import messagebox, VERTICAL, HORIZONTAL, NW
from datetime import datetime
import pygame
from pygame import *
import sys  # 외장 모듈
from pygame.locals import *  # QUIT 등의 pygame 상수들을 로드한다.
import cx_Oracle as oci
from PIL import ImageTk, Image
from tkinter import filedialog as tkfd
from tkinter import filedialog

mod = sys.modules[__name__]
idx = 0
pygame.init()
pygame.mixer.init()


def saveMusic(data):
    loopupdate()
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = """
        INSERT INTO watermelon(mNum, mTitle, mSinger)
        VALUES(nNum_seq.nextval, :0, :1)
        """
    cursor.execute(sql, data)  # 각 인덱스에 data 값 삽입
    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()
    viewMusic()


def viewMusic():
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = "SELECT ROWNUM, w.mtitle, w.msinger, w.mnum FROM watermelon w ORDER by w.mnum"
    cursor.execute(sql)
    datas = cursor.fetchall()
    for rows in datas:
        global idx
        print(rows)
        setattr(mod, "chkvar{}".format(rows[0]), tk.IntVar())
        setattr(mod, "chkmusic{}".format(rows[0]), rows[1] + "_" + rows[2])
        setattr(mod, "chkbox{}".format(rows[0]),
                tk.Checkbutton(mlist, text=rows[1] + " - " + rows[2], variable=eval("chkvar{}".format(rows[0]))))
        eval("chkbox{}".format(rows[0])).grid(row=rows[0] - 1, column=0)
        setattr(mod, "chkb{}".format(rows[0]),
                tk.Button(mlist, text="▷", command=lambda x=rows[1] + "_" + rows[2]: play(x)))
        eval("chkb{}".format(rows[0])).grid(row=rows[0] - 1, column=1)
        mlist.update()
        window.update()
        idx = rows[0]

    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()


def btncmd():
    cart = []
    flag = False
    count = 0
    chkv = zip([eval("chkvar{}".format(i)) for i in range(1, idx + 1)],
               [eval("chkmusic{}".format(i)) for i in range(1, idx + 1)])
    for i, j in chkv:
        print(i.get(), j)
        if i.get() == 1:
            print("in")
            cart.append(j + "|")
            flag = True
            count += 1

    cart = "".join(cart).replace("|", "\n")

    if flag is False:
        tk.messagebox.showerror("확인", "다운로드할 음악을 선택해주세요!")
        return
    else:
        msg = tk.messagebox.askquestion("확인", str(cart) + "총 " + str(count) + "곡을 다운로드 하시겠습니까?")
        if msg == "yes":
            tk.messagebox.showinfo("확인", "다운로드 되었습니다!")


def play(file):
    print(file)
    pygame.mixer.music.load("music/" + file + ".mp3")
    pygame.mixer.music.play(loops=0)
    viewImage(file)


def volume(x):
    pygame.mixer.music.set_volume(float(x))


def viewImage(file):
    image = tk.PhotoImage(file="music/" + file + ".gif")

    label = tk.Label(image1, image=image).grid(row=idx + 5, column=0)
    image1.pack()
    image1.update()
    window.update()
    window.mainloop()


def btnadd():
    filename = filedialog.askopenfilename(initialdir="/", title="Select file",
                                          filetypes=(("mp3 files", "*.mp3"), ("all files", "*.*")))


    if filename[-3:] != "mp3":
        return
    data = filename[filename.rfind("/") + 1:-4]
    title = data.split("_")[0]
    singer = data.split("_")[1].replace(".mp3", "")
    file = title, singer
    print(file)
    saveMusic(file)


def btndel():
    cart = []
    flag = False
    count = 0
    chkv = zip([eval("chkvar{}".format(i)) for i in range(1, idx + 1)],
               [eval("chkmusic{}".format(i)) for i in range(1, idx + 1)])
    for i, j in chkv:
        if i.get() == 1:
            cart.append(j)
            flag = True
            count += 1

    print(cart)
    if flag is False:
        return

    query = ""
    for i in cart:
        query += "(mTitle = '"
        query += i.split("_")[0]
        query += "' and mSinger = '"
        query += i.split("_")[1]
        query += "')"
        if cart.index(i) < len(cart) - 1:
            query += " or "

    loopupdate()
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = "DELETE FROM watermelon WHERE " + query
    print(sql)
    cursor.execute(sql)  # 각 인덱스에 data 값 삽입
    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()

    viewMusic()

def loopupdate():
    conn = oci.connect("SCOTT/TIGER@127.0.0.1:1521/xe")
    cursor = conn.cursor()
    sql = "SELECT ROWNUM, w.mtitle, w.msinger, w.mnum FROM watermelon w ORDER by w.mnum"
    cursor.execute(sql)
    datas = cursor.fetchall()
    for rows in datas:
        getattr(mod, "chkbox{}".format(rows[0])).delete()
        getattr(mod, "chkb{}".format(rows[0])).delete()
    cursor.close()
    conn.commit()  # 파이썬은 오토커밋 X
    conn.close()

window = tk.Tk()
window.title("Water Melon")
window.geometry("640x400+100+100")
window.resizable(True, True)

mlist = tk.Frame(window)
mlist.pack()

frame1 = tk.Frame(window)
frame1.pack()

image1 = tk.Frame(window)

viewMusic()

volvar = tk.DoubleVar()
volume_slider = tk.Scale(frame1, from_=0, to=1, resolution=0.1, showvalue=False, orient=HORIZONTAL, variable=volvar,
                         command=lambda x=volvar: volume(x), length=100).grid(row=idx + 2, column=0)

canvas = tk.Canvas(frame1, width=350, height=1, bg="black", bd=2).grid(row=idx + 1, column=0)

btn = tk.Button(frame1, text="다운로드", command=btncmd).grid(row=idx + 3, column=0)
btn1 = tk.Button(frame1, text="추가", command=btnadd).grid(row=idx + 3, column=1)
btn2 = tk.Button(frame1, text="삭제", command=btndel).grid(row=idx + 4, column=1)


window.mainloop()
