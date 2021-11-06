### Kiosk Contacts

#### Introduction

This app is designed to work on a kiosk tablet at at an event. It presents a configurable screen form to enter contact information. It can be run in the iOS "kiosk" mode on an iPhone or iPad.

The kiosk operator invites a visitor to enter his or her contact information to share with the kiosk operator for the purpose of getting further information from the kiosk operator. *Kiosk Contacts* can be configured to send a mail or message immediately to the vistor.

The app saves collected information to a file, and initiates the sending of a welcome mail or message to the mail address or telephone number entered on the form.

#### Requirements

The minimum OS is:

 - iOS or iPadOS 14.0 or greater

#### Access to Data

This app presents a simple, configurable contact information form, when the **Submit** button is tapped, it saves the information in the form to a file in the app's documents directory. The collected information is not verified. The data is saved to a comma separated values, CSV, file, named *contacts.csv*. Modern spreadsheet applications, i.e. MS Excel or Apple Numbers, can open this file for further processing.

To find the documents for the *Kiosk Contacts* app, use the iOS *Files* app. Open the *Files* app, then navigate to *On My iPad* on an iPad or *On My iPhone* on an iPhone. There will be a folder for *Kiosk Contacts*. Tap on *Kiosk Contacts* and you will see a display of the files there. You will only see the files after the app has been started at least once.

The following files are present, they are described in detail below.

- 1024 (.png)
- contacts (.csv)
- mail (.txt)
- message (.txt)
- README (.pdf)
- README (.md)
- settings (.txt)
- VM Logo Color Thrive Tag (.jpg)

##### Files App

The iOS *File*s app can be used to examine or share a file. Tap and hold on a file for a pop-up menu of actions, among which are *Quick Look* and *Share*. Use *Share* to share a file with, for example, *Mail*. Using this, you can send the *contacts.csv* file to another computer for processing.

##### Kiosk Contacts Files

The files  in the *Kiosk Contacts* folder contain either configuration information, i.e. *settings.txt*, or text and fields for the subject and body of the mail message, *mail.txt*, or of the iMessage message, *message.txt*. The fields will be replaced by either configuration information or by fields from the form data when a mail or a message is sent.. This is described below in the *Substitions* section below.

The files in the *Kiosk Contacts* folder are:

###### README

This is this document which describes and informs the usage of *Kiosk Contacts*. This file is there in both text ".md" and ".pdf" formats. You are reading this file.

###### contacts

This file *contacts.csv* contains the saved contacts from tapping the **Submit** button. Apple *Numbers* can directly open this file, or this file can be shared to be opened and processed on another device, where it might be processed with, for example, MS Excel.

###### mail

This file *mail.txt* contains the "from:" and "subject:" fields and the body of a mail message to be sent to the contact when **Submit** is tapped. This file may be edited and certain fields entered to be replaced by text from the contact form.

The "from:" address must be in the list of possible sender addresses on the device to be used, otherwise Mail will use a From: address present on the device.

The "subject:" is the Subject: of the mail message.

The "---" must be left in place as a separator line.

###### message

This file *message.txt* contains the body of an iMessage to be sent to the contact when **Submit** is tapped, if so configured. This file may be edited and certain fields entered to be replaced by text from the contact form.

###### 1024

*1024.png* is the default image file used as a logo icon in the *Kiosk Contacts* app. You can add most any image file, i.e. JPEG or PNG file, to be used as your own icon or logo in the app.

###### VM Logo Color Thrive Tag

This is another sample image file, *VM Logo Color Thrive Tag.jpg*.

###### settings

This file *settings.txt* contains the settings for the app. You can edit this with any text editor app or inside the *Kiosk Contacts* app.

These settings may be edited "in app". Tap on the icon/logo four times and a view will be opened in which the configuration files may be read. There you must enter the pin which is set in the *settings.txt* file.

The settings here (and their defaults, these should be changed appropriately) are:

- pin=\*\*\*\*

  This is the pin to be used to edit the files inside the *Kiosk Contacts* app.

- kiosktitle=Conference East

  Sets the title of the app.

- subtitle=VM Kiosk

  Sets the subtitle of the app.

- event=conference

  Used in substations.

- image=VM Logo Color Thrive Tag.jpg

  Logo.



- mailsend=1

  Set to 0 or 1. If 1, then a mail is sent.

- messagesend=0

  Set to 0 or 1. If 1, then an iMessage is sent.

  Only one of mailsend or messagesend should be set to 1. If both are set, then a mail message will be preferred. If both are set, and only one of the fields in the form are filled out, then that is preferred.



- title=1

  Set to 1 to collect a title, such as "Mr.", "Mrs.", etc.

- middlename=0

  Set to 1 to collect the middle initial.

- middleinitial=0

  Set to 1 to collect the middle name.

- suffix=1

  Set to 1 to collect a name suffix, such as "Jr.", "III", etc.



- addressline2=0

  Set to 1 to display and collect the second line of an address.

- country=0

  Set to 1 to collect the state.

- organization=0

  Set to 1 to collect an organization.



- mailaddress=1

  Set to 1 to collect an mail address.

- phone=1

  Set to 1 to collect the phone number.

#### Substitions

These fields may be included in the mail, message, and subject files and will be substituted with data from the settings or the forms.

##### Settings

- kiosktitle
- subtitle
- event

##### Contact Form Data

- title

- firstname

- middlename

- middleinitial

- lastname

- suffix



- addressline1

- addressline2

- city

- state

- zipcode

- country



- organization


- mailaddress

- phone

#### Editing the Configuration Files

The files are intended to be edited to configure the form field settings and the contents of the messages to be sent for a particular event.

##### *Kiosk Contacts* Editor

*Kiosk Contacts* has a built-in editor for its files. This is hidden from the normal user.  There are two controls to hide this:

1) Tap on the logo/icon **four times** to enter the pop-up editor view.
2) You must enter the pin (recommended 4 or 5 digits), which is in the *settings.txt* file, to be allowed to edit.

You will then enter an editor view where you can select which file to edit, edit the file, and cancel or save the file.

You can also copy the files to a computer, edit them there, and then copy back, with the assistance of the Files App and, for example, Mail.  Mail the files to yourself on your computer, edit them as desired, then mail them back to the iOS device, and save them from Mail back to the *Kiosk Contacts* folder.

#### Kiosk Mode

iOS supports a kiosk mode, allowing access to a single application.  You may use this to lock access to only *Kiosk Contacts*.

On iOS 15, this is activated under:

**Settings** -> **Accessibility** -> **Guided Access**

There you may switch Guided Access to on and set up the Passcode Settings. Read the instructions there on how to start and stop it.

#### Privacy

*Kiosk Contacts* collects contact information and stores it in a file inside the app. That information is given voluntarily, normally a person enters his or her own information into the app, with the intention of providing the information to the event host. This app does not use the information in any way other than simply to collect it and store it in the app.

#### Support and Information

Please contact  [Rand](mailto:rand@randix.net) or see the [documentation page](https://randix.github.io/KioskContacts) for current information.

<br/>Get *Kiosk Contacts*:

[![Download_on_the_App_Store_Badge_US-UK_RGB_blk_092917](Download_on_the_App_Store_Badge_US-UK_RGB_blk_092917.svg)](https://apps.apple.com/us/app/kiosk-contacts/id1591801409)

<br/><font size=2>© 2021 Randix LLC</font>
