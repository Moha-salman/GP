import os
from tkinter import *
from cryptography.fernet import Fernet
import password as password
import username as username
def delete2():
 screen3.destroy()

def delete3():
 screen4.destroy()
def delete4():
 screen5.destroy()
def login_sucess():
    global screen3
    screen3 = Toplevel(screen)
    screen3.title('Sign up')
    screen3.geometry('150x100')
    Label(screen3,text = "Login Sucess")
    Button(screen3,text="ok",command=delete2()).pack

def password_not_recognized():
    global screen5
    screen5 = Toplevel(screen)
    screen5.title('Sign up')
    screen5.geometry('150x100')
    Label(screen5,text="password not recognized")
    Button(screen5,text="ok", command=delete4()).pack


def user_not_found():
    global screen4
    screen4 = Toplevel(screen)
    screen4.title('Sign up')
    screen4.geometry('150x100')
    Label(screen4,text="User not found")
    Button(screen4,text="ok", command=delete3()).pack
def register_user():
    username_info = username.get()
    password_info = password.get()
    file=open(username_info+'text','w')
    file.write(username_info+'\n')
    file.write(password_info)
    file.close()
    username_entery.delete(0,END)
    password_entery.delete(0, END)
    Label(screen1,text = "Registration Sucess", font=('courier', 15)).pack()
def register():
    global screen1
    screen1 = Toplevel(screen)
    screen1.title('Sign up')
    screen1.geometry('500x500')

    global username
    global password
    global username_entery
    global password_entery
    username = StringVar()
    password = StringVar()
    Label(screen1, text='Please enter your info:*').pack()
    Label(screen1, text='').pack()
    Label(screen1, text='Username *').pack()
    username_entery = Entry(screen1, textvariable=username)
    username_entery.pack()
    Label(screen1, text='Password *').pack()
    password_entery =Entry(screen1, textvariable=password)
    password_entery.pack()
    Button(screen1,text='Register', font=('courier', 15), bg='#246B98', width='12', command=register_user).pack()
def login_verify():
    username1 =username_verify.get()
    password1 =password_verify.get()
    username_entery1.delete(0,END)
    password_entery1.delete(0, END)
    list_of_files = os.listdir()
    if username1 in list_of_files:
      file1= open(username1, "r")
      verify = file1.read().splitlines()
      if password1 in verify:
        login_sucess()
      else:
        password_not_recognized()
    else:
        user_not_found()
def login():
    global screen2
    screen2 = Toplevel(screen)
    screen2.title('Sign up')
    screen2.geometry('500x500')
    Label(screen2, text='Please enter your info:*').pack()
    Label(screen2, text='').pack()


    global username_verify
    global password_verify
    username_verify = StringVar()
    password_verify = StringVar()
    global username_entery1
    global password_entery1

    Label(screen2, text='Username *').pack()
    username_entery1 = Entry(screen2, textvariable=username_verify)
    username_entery1.pack()
    Label(screen2, text='').pack()
    Label(screen2, text='Password *').pack()
    password_entery1 = Entry(screen2, textvariable=password_verify)
    password_entery1.pack()
    Label(screen2, text="").pack
    Button(screen2, text='Login', font=('courier', 15), bg='#246B98', width='12', command=login_verify).pack()


def main_screen():

    global screen
    screen = Tk()
    screen.title('Password encrption')
    screen.geometry('500x500')
    screen.config(background='#FFFCFC')
    Label(text='Sign up & Login', font=('courier', 15), bg='black', fg='white').pack()
    Label(text="").pack()
    Button(text='Register', font=('courier', 15), bg='#246B98', width='12', command=register).pack()
    Label(text="").pack()
    Button(text='login', font=('courier', 15), bg='#612498', width='12',command=login).pack()


    screen.mainloop()
main_screen()
