# PSD the-easy-mounting-Python-Serial-Display
the easy mounting Python Serial Display, with 5-hole mounting, based on LVGL

![7zoll2](https://user-images.githubusercontent.com/96583658/209567339-529f9711-2b8f-4095-b94b-52df2934b2fe.jpg)



Here comes a new type of a "smart Display", with a revolutionary easy mounting concept, integrated uPython interpreter and serial UART interface.

Easy to mount: only 5 drill holes are required, no cutout!
![4 3-espiff](https://user-images.githubusercontent.com/96583658/209538952-2572915b-9a6f-4802-9554-c27e080a340f.jpg)

4 holes with 3.5mm or 4mm diameter, to screw the display onto any wall or enclosure.
1 hole with about 10mm diameter, to bring out the cable.

While the PSD was made for the EsPiFF, it can be used with any Arduino, Raspberry Pi or other board, what offers a 3.3V UART (RXD, TXD), and a 5V supply with >= 500mA. Most Arduinos and/or Pis and clones offer this.

For the EsPiFF, there is a special 6 pol cable included, to connect direct to the EsPiFF display connector. Fro Arduinos and Raspberry Pi and clones, there is a color coded display to Dupoint cable. Connect the black cable to GND, the red cable to 5V, the blue cable to RXD and the green cable to TXD. 

![4 3-espiff-extracable](https://user-images.githubusercontent.com/96583658/209541155-f0766969-1d24-4e74-ad03-c96fe39aac0f.jpg)


What also makes the PSD attractive, is the fact, that users can freely program the PSD, ether in C/C++ or Python. The display processor is a ESP32-S3 and the uPython-LVGL port is flashed on it. Even if you are not familiar with uPython, you can easy adapt the samples from the [LVGL homepage](https://docs.lvgl.io/latest/en/html/widgets/index.html). The Python REPL (Read Evaluate Print Loop) is available on the UART, so with your EsPiFF/Raspi/Arduino you can just send Python commands to the display. And get responses, like Button click events, back. 

Lets make a simple example: a screen with 2 buttons, 

```
def event_handler(source,evt):
    if evt == lv.EVENT.CLICKED:
        if source == btn1:
            # treat "clicked" events only for btn1
            print("Clicked")
        elif evt == lv.EVENT.VALUE_CHANGED:
            print("Toggled")


# create a simple button
btn1 = lv.btn(lv.scr_act(),None)
# attach the callback
btn1.set_event_cb(event_handler)
btn1.align(None,lv.ALIGN.CENTER,0,-40)
label=lv.label(btn1,None)
label.set_text("Button")

# create a toggle button
btn2 = lv.btn(lv.scr_act(),None)
# attach the callback
btn2.set_event_cb(event_handler)
btn2.align(None,lv.ALIGN.CENTER,0,40)
btn2.set_checkable(True)
btn2.toggle()
#btn2.set_fit2(lv.FIT.NONE,lv.FIT.TIGHT)
label=lv.label(btn2,None)
label.set_text("Toggled")
```

Creating GUIs by code is one opion, another option is to use the Visual Form Designer (work in progress, just started).
![VisualFormDesignerPSD](https://user-images.githubusercontent.com/96583658/209545441-748d6d15-1856-44c5-8948-1c495c8b5c08.png)

Python code editor:
![VisualFormDesignerPSD_codeEdit](https://user-images.githubusercontent.com/96583658/209545473-0f5242bc-9334-4d79-953f-b0b7a82a68ad.png)


It looks a bit like [Delphi 7](https://de.wikipedia.org/wiki/Embarcadero_Delphi), the legendary Borland RAD tool. This is also the intention, to build a IDE with the same comfort we had in the Delphi 7 days: just place your buttons, charts, edit fields and so on onto a form, set its properties, write some event handler and the application run. 







