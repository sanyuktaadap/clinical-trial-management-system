import tkinter as tk
from tkinter import ttk
from tkinter import * 
from clinical_db_utils import *

# Created using http://www.python-gui-builder.com/

class TestView(tk.Frame):
    def __init__(self, parent):
        tk.Frame.__init__(self, parent)
        self.canvas = None
        self.vscrollbar = ttk.Scrollbar(self, orient=VERTICAL)
        self.vscrollbar.pack(fill=Y, side=RIGHT, expand=FALSE)
    
    def update_table(self, tests):
        if self.canvas is not None:
            self.canvas.destroy()
        
        self.canvas = tk.Canvas(self, bd=0, highlightthickness=0,
                           yscrollcommand=self.vscrollbar.set,  width = 300, height = 150)
        self.canvas.pack(side=LEFT, fill=BOTH, expand=TRUE)
        self.vscrollbar.config(command=self.canvas.yview)
        self.canvas.xview_moveto(0)
        self.canvas.yview_moveto(0)
        
        self.widgets = {}
        
        self.table = tk.Frame(self)
        self.canvas.create_window(0, 0, window=self.table, anchor=NW)
            
        self.table.grid_columnconfigure(1, weight=1)
        self.table.grid_columnconfigure(2, weight=1)
        
        self.widgets[0] = {
            "TestId": tk.Label(self.table, text='TestId',  font=('arial', 12, 'bold')),
            "Name": tk.Label(self.table, text='Name',  font=('arial', 12, 'bold')),
            "Threshold": tk.Label(self.table, text='Threshold',  font=('arial', 12, 'bold')),
        }
        self.widgets[0]["TestId"].grid(row=0, column=0, sticky="nsew")
        self.widgets[0]["Name"].grid(row=0, column=1, sticky="nsew")
        self.widgets[0]["Threshold"].grid(row=0, column=2, sticky="nsew")
    
        i = 1
        for testId, name, thresh in tests:
            self.widgets[i] = {
                "TestId": tk.Label(self.table, text=testId),
                "Name": tk.Label(self.table, text=name),
                "Threshold": tk.Label(self.table, text=thresh),
            }

            self.widgets[i]["TestId"].grid(row=i, column=0, sticky="nsew")
            self.widgets[i]["Name"].grid(row=i, column=1, sticky="nsew")
            self.widgets[i]["Threshold"].grid(row=i, column=2, sticky="nsew")
            i += 1

# Form SQL connection
conn = connect_db()

# this is a function to get the user input from the text input box
def getInputBoxValue(textBox):
	userInput = textBox.get()
	return userInput


# this is a function to reset the user input.
def resetInputBoxValue(textBox):
    textBox.delete(0, tk.END)


# this is the function called when the button is clicked
def addOrUpdateTest():
    
    results = get_tests(conn, getInputBoxValue(test_id))
    
    if len(results) == 0:
        # Create new entry
        add_test(conn, 
                 getInputBoxValue(test_id), 
                 getInputBoxValue(test_name), 
                 getInputBoxValue(test_threshold))
        output_label.config(text = f'Test - {getInputBoxValue(test_id)} added successfully!')
    else:
        # Update existing entry
        update_test(conn,
                    getInputBoxValue(test_id), 
                    getInputBoxValue(test_name), 
                    getInputBoxValue(test_threshold))
        output_label.config(text = f'Test - {getInputBoxValue(test_id)} edited successfully!')

    resetInputBoxValue(test_id)
    resetInputBoxValue(test_name)
    resetInputBoxValue(test_threshold)
    
def deleteTest():
    
    results = get_tests(conn, getInputBoxValue(test_id))
    
    if len(results) == 0:
        print(f'Test - {getInputBoxValue(test_id)} does not exist!')
        output_label.config(text = f'Test - {getInputBoxValue(test_id)} does not exist!')
    else:
        delete_test(conn, getInputBoxValue(test_id))
        output_label.config(text = f'Test - {getInputBoxValue(test_id)} deleted successfully!')
        
    resetInputBoxValue(test_id)
    resetInputBoxValue(test_name)
    resetInputBoxValue(test_threshold)

def refreshTestView():
    tests = get_tests(conn)
    test_view.update_table(tests)

root = Tk()

# This is the section of code which creates the main window
root.geometry('885x578')
root.configure(background='#E0EEEE')
root.title('Test Form')

# Add image file
bg = PhotoImage(file = "extra/gui_bg.png")
  
# Create Canvas
canvas1 = Canvas(root, width = 885, height = 578)
canvas1.pack(fill = "both", expand = True)
  
# Display image
canvas1.create_image( 0, 0, image = bg, 
                     anchor = "nw")

# This is the section of code which creates a text input box
test_id=Entry(root)
test_id.place(x=350, y=200)


# This is the section of code which creates the a label
Label(root, text='Test_Id', bg='#E0EEEE', font=('arial', 12, 'bold')).place(x=210, y=200)


# This is the section of code which creates a text input box
test_name=Entry(root)
test_name.place(x=350, y=250)


# This is the section of code which creates the a label
Label(root, text='Name', bg='#E0EEEE', font=('arial', 12, 'bold')).place(x=210, y=250)


# This is the section of code which creates a text input box
test_threshold=Entry(root)
test_threshold.place(x=350, y=300)


# This is the section of code which creates the a label
Label(root, text='Threshold', bg='#E0EEEE', font=('arial', 12, 'bold')).place(x=210, y=300)


# This is the section of code which creates a button
Button(root, text='Add / Edit', bg='#C1CDCD', font=('arial', 12, 'normal'), command=addOrUpdateTest).place(x=250, y=380)

# This is the section of code which creates a button
Button(root, text='Delete', bg='#C1CDCD', font=('arial', 12, 'normal'), command=deleteTest).place(x=350, y=380)

# This is the section of code which creates a button
Button(root, text='Refresh', bg='#C1CDCD', font=('arial', 12, 'normal'), command=refreshTestView).place(x=430, y=380)

# This is the section of code which creates the a label
output_label = Label(root, text='', bg='#E0EEEE', font=('arial', 12, 'normal'))
output_label.place(x=200, y=450)

tests = get_tests(conn)

test_view = TestView(root)
test_view.place(x=550, y=180)

root.mainloop()
